running
testCounts

	| wrapper instance |
	wrapper := self wrapperClass on: #methodDelay inClass: MwClassA.
	wrapper install.
	instance := MwClassA new.
	self assert: wrapper count = 0.
	instance methodDelay.
	self assert: wrapper count = 1.
	instance methodDelay.
	self assert: wrapper count = 2.
	wrapper uninstall.