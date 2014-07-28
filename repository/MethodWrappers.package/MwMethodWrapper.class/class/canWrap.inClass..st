testing
canWrap: aSelector inClass: aClass
	"Test if a method can be wrapped without causing infinite recursion."

	| class method |
	(aClass includesBehavior: MwMethodWrapper) ifTrue: [^ false].
	aClass isTrait ifTrue: [^ false].
	((aClass includesBehavior: CompiledMethod)
		and: [aSelector == #valueWithReceiver:arguments:])
			ifTrue: [^ false].
	((aClass includesBehavior: BlockContext)
		and: [aSelector == #ensure:])
			ifTrue: [^ false].
	class := aClass whichClassIncludesSelector: aSelector.
	class isNil ifTrue: [^ false].
	method := class compiledMethodAt: aSelector ifAbsent: [nil].
	^ method notNil and: [(self primitives includes: method primitive) not]