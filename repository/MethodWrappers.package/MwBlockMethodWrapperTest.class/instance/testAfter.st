running
testAfter

	| wrapper instance |
	instance := MwClassA new.
	wrapper := self wrapperClass on: #methodOne inClass: MwClassA.
	wrapper
		afterBlock: [:receiver :arguments | self result: self result + 4];
		install.
	instance methodOne.
	wrapper uninstall.
	self assert: self result = 4.