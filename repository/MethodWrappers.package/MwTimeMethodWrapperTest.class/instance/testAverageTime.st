running
testAverageTime

	| wrapper instance count |
	count := 10.
	wrapper := self wrapperClass on: #methodDelay inClass: MwClassA.
	wrapper install.
	instance := MwClassA new.
	count timesRepeat: [instance methodDelay].
	self assert: wrapper count = count.
	self assert: (wrapper time / count asFloat) = wrapper averageTime.
	wrapper uninstall.