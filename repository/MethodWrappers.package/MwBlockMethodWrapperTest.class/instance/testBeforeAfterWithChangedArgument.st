running
testBeforeAfterWithChangedArgument

	| wrapper instance |
	instance := MwClassA new.
	instance x: 0.
	wrapper := self wrapperClass on: #methodWithArgument: inClass: MwClassA.
	wrapper
		beforeBlock: [:receiver :arguments | arguments at: 1 put: (arguments first raisedTo: 4)];
		afterBlock: [:receiver :arguments | receiver x: receiver x + (arguments first raisedTo: 3)];
		install.
	self result: (instance methodWithArgument: 2).
	wrapper uninstall.
	self assert: self result = 16. "0 + 2^4"
	self assert: instance x = 4112. "0 + 2^4+ (2^4)^3"