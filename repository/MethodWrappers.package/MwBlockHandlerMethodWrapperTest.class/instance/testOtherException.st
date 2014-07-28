running
testOtherException

	| wrapper instance |
	instance := MwClassA new.
	self should: [instance methodWithException] raise: Warning.
	self assert: self result = 0.
	wrapper := self wrapperClass on: #methodWithException inClass: MwClassA.
	wrapper
		exception: Error;
		handlerBlock: [:receiver :arguments :ex | 42];
		install.
	self should: [self result: instance methodWithException] raise: Warning.
	wrapper uninstall.
	self assert: self result = 0.