running
testCalledWasActive

	| wrapper instance |
	wrapper := self wrapperClass on: #methodOne inClass: MwClassA.
	wrapper install.
	instance := MwClassA new.
	self assert: wrapper called not.
	self assert: wrapper wasActive not.
	instance methodOne.
	self assert: wrapper wasActive.
	wrapper uninstall.