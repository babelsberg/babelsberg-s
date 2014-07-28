running
testBeforeAfterWithReceiver

	| wrapper instance |
	instance := MwClassA new.
	instance x: 0.
	wrapper := self wrapperClass on: #methodWithArgument: inClass: MwClassA.
	wrapper
		beforeBlock: [:receiver :arguments | receiver x: receiver x + 3];
		afterBlock: [:receiver :arguments | receiver x: receiver x + 4];
		install.
	self result: (instance methodWithArgument: 2).
	wrapper uninstall.
	self assert: self result = 5.
	self assert: instance x = 9.