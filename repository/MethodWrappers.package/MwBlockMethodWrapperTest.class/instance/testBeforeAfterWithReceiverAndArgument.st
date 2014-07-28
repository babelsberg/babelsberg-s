running
testBeforeAfterWithReceiverAndArgument

	| wrapper instance |
	instance := MwClassA new.
	instance x: 0.
	wrapper := self wrapperClass on: #methodWithArgument: inClass: MwClassA.
	wrapper
		beforeBlock: [:receiver :arguments | receiver x: receiver x + (arguments first raisedTo: 2)];
		afterBlock: [:receiver :arguments | receiver x: receiver x + (arguments first raisedTo: 3)];
		install.
	self result: (instance methodWithArgument: 2).
	wrapper uninstall.
	self assert: self result = 6. "0 + 2^2 + 2"
	self assert: instance x = 14. "0 + 2^2 + 2 + 2^3"