running
testException

	| wrapper instance |
	instance := MwClassA new.
	self should: [self result: instance methodWithException] raise: Warning.
	self assert: self result = 0.
	wrapper := self wrapperClass on: #methodWithException inClass: MwClassA.
	wrapper
		exception: Warning;
		handlerBlock: [:receiver :arguments :ex | 42];
		install.
	self shouldnt: [self result: instance methodWithException] raise: Warning.
	wrapper uninstall.
	self assert: self result = 42.