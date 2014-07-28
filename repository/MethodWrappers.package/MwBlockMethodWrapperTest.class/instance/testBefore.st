running
testBefore

	| wrapper instance |
	instance := MwClassA new.
	wrapper := self wrapperClass on: #methodOne inClass: MwClassA.
	wrapper
		beforeBlock: [:receiver :arguments | self result: self result + 3];
		install.
	instance methodOne.
	wrapper uninstall.
	self assert: self result = 3.