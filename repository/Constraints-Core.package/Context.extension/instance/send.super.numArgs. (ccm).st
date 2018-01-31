*Constraints-Core
send: selector super: superFlag numArgs: numArgs
	"Simulate the action of bytecodes that send a message with selector, 
	selector. The argument, superFlag, tells whether the receiver of the 
	message was specified with 'super' in the source method. The arguments 
	of the message are found in the top numArgs locations on the stack and 
	the receiver just below them."
	<layer: #ccm>
	| receiver arguments lookupClass returnValue nextContextOrNil |
	arguments := Array new: numArgs.
	numArgs to: 1 by: -1 do: [ :i | arguments at: i put: self pop].
	receiver := self pop.

	nextContextOrNil := self runProcessInConstraintsLibraryReceiver: receiver selector: selector arguments: arguments superFlag: superFlag.
	nextContextOrNil ifNotNil: [^ nextContextOrNil].

	selector = #signal
		ifTrue: [self halt].

	selector = #collectConstraintsFrom:
		ifTrue: [
			returnValue := arguments first.
			self processReturnValueFromConstraintBlock: returnValue
			"proceed but expect nothing in particular"].

	lookupClass := superFlag
					ifTrue: [method methodClassAssociation value superclass]
					ifFalse: [self objectClass: receiver].
	QuickStep == self ifTrue:
		[QuickStep := nil.
		^self quickSend: selector to: receiver with: arguments lookupIn: lookupClass].
	^self send: selector to: receiver with: arguments lookupIn: lookupClass