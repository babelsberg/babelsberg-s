*Constraints
doPrimitive: primitiveIndex method: meth receiver: receiver args: arguments 
	"Simulate a primitive method whose index is primitiveIndex.  The
	 simulated receiver and arguments are given as arguments to this message.
	 If successful, push result and return resuming context, else ^ PrimitiveFailToken.
	 Any primitive which provokes execution needs to be intercepted and simulated
	 to avoid execution running away."
	<layer: #ccm>
	| value |
	"Judicious use of primitive 19 (a null primitive that doesn't do anything) prevents
	 the debugger from entering various run-away activities such as spawning a new
	 process, etc.  Injudicious use results in the debugger not being able to debug
	 interesting code, such as the debugger itself.  hence use primtiive 19 with care :-)"
	"SystemNavigation new browseAllSelect: [:m| m primitive = 19]"
	"The layered method only changes the last line: push the value or a constraint variable depending on the method"
	primitiveIndex = 19 ifTrue:
		[ToolSet 
			debugContext: self
			label:'Code simulation error'
			contents: nil].

	"ContextPart>>blockCopy:; simulated to get startpc right"
	(primitiveIndex = 80 and: [(self objectClass: receiver) includesBehavior: ContextPart]) 
		ifTrue: [^self push: ((BlockContext newForMethod: receiver method)
						home: receiver home
						startpc: pc + 2
						nargs: (arguments at: 1))].
	(primitiveIndex = 81 and: [(self objectClass: receiver) == BlockContext]) "BlockContext>>value[:value:...]"
		ifTrue: [^receiver pushArgs: arguments from: self].
	(primitiveIndex = 82 and: [(self objectClass: receiver) == BlockContext]) "BlockContext>>valueWithArguments:"
		ifTrue: [^receiver pushArgs: arguments first from: self].
	primitiveIndex = 83 "afr 9/11/1998 19:50" "Object>>perform:[with:...]"
		ifTrue: [^self send: arguments first
					to: receiver
					with: arguments allButFirst
					super: false].
	primitiveIndex = 84 "afr 9/11/1998 19:50 & eem 8/18/2009 17:04" "Object>>perform:withArguments:"
		ifTrue: [^self send: arguments first
					to: receiver
					with: (arguments at: 2)
					startClass: nil].
	primitiveIndex = 100 "eem 8/18/2009 16:57" "Object>>perform:withArguments:inSuperclass:"
		ifTrue: [^self send: arguments first
					to: receiver
					with: (arguments at: 2)
					startClass: (arguments at: 3)].

	"Mutex>>primitiveEnterCriticalSection
	 Mutex>>primitiveTestAndSetOwnershipOfCriticalSection"
	(primitiveIndex = 186 or: [primitiveIndex = 187]) ifTrue:
		[| active effective |
		 active := Processor activeProcess.
		 effective := active effectiveProcess.
		 "active == effective"
		 value := primitiveIndex = 186
					ifTrue: [receiver primitiveEnterCriticalSectionOnBehalfOf: effective]
					ifFalse: [receiver primitiveTestAndSetOwnershipOfCriticalSectionOnBehalfOf: effective].
		 ^((self objectClass: value) == Array
		    and: [value size = 2
		    and: [value first == PrimitiveFailToken]])
			ifTrue: [value]
			ifFalse: [self push: value]].

	primitiveIndex = 188 ifTrue: "eem 5/27/2008 11:10 Object>>withArgs:executeMethod:"
		[^MethodContext
			sender: self
			receiver: receiver
			method: (arguments at: 2)
			arguments: (arguments at: 1)].

	"Closure primitives"
	(primitiveIndex = 200 and: [self == receiver]) ifTrue:
		"ContextPart>>closureCopy:copiedValues:; simulated to get startpc right"
		[^self push: (BlockClosure
						outerContext: receiver
						startpc: pc + 2
						numArgs: arguments first
						copiedValues: arguments last)].
	((primitiveIndex between: 201 and: 205)			 "BlockClosure>>value[:value:...]"
	or: [primitiveIndex between: 221 and: 222]) ifTrue: "BlockClosure>>valueNoContextSwitch[:]"
		[^receiver simulateValueWithArguments: arguments caller: self].
	primitiveIndex = 206 ifTrue:						"BlockClosure>>valueWithArguments:"
		[^receiver simulateValueWithArguments: arguments first caller: self].

	primitiveIndex = 118 ifTrue: "tryPrimitive:withArgs:; avoid recursing in the VM"
		[(arguments size = 2
		 and: [arguments first isInteger
		 and: [(self objectClass: arguments last) == Array]]) ifFalse:
			[^ContextPart primitiveFailTokenFor: nil].
		 ^self doPrimitive: arguments first method: meth receiver: receiver args: arguments last].

	value := primitiveIndex = 120 "FFI method"
				ifTrue: [(meth literalAt: 1) tryInvokeWithArguments: arguments]
				ifFalse:
					[primitiveIndex = 117 "named primitives"
						ifTrue: [self tryNamedPrimitiveIn: meth for: receiver withArgs: arguments]
						ifFalse:
							[receiver tryPrimitive: primitiveIndex withArgs: arguments]].
	^((self objectClass: value) == Array
	    and: [value size = 2
	    and: [value first == PrimitiveFailToken]])
		ifTrue: [value]
		ifFalse: [self push: (self valueOrConstraintVariableFor: meth receiver: receiver value: value)]