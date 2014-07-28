running
testNoException

	| wrapper instance |
	instance := MwClassA new.
	self shouldnt: [self result: instance methodWithoutException] raise: Warning.
	self assert: self result = 69.
	wrapper := self wrapperClass on: #methodWithoutException inClass: MwClassA.
	wrapper
		exception: Warning;
		handlerBlock: [:receiver :arguments :ex | 42];
		install.
	self shouldnt: [self result: instance methodWithoutException] raise: Warning.
	wrapper uninstall.
	self assert: self result = 69.