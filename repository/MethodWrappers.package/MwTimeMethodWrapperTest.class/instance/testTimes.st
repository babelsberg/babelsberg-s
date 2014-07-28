running
testTimes

	| wrapper instance previousTime |
	wrapper := self wrapperClass on: #methodDelay inClass: MwClassA.
	wrapper install.
	instance := MwClassA new.
	self assert: wrapper time = 0.
	previousTime := wrapper time.
	instance methodDelay.
	self assert: wrapper time > previousTime.
	previousTime := wrapper time.
	instance methodDelay.
	self assert: wrapper time > previousTime.
	wrapper uninstall.