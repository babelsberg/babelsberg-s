testing
testOverlappingExclusiveRegionWithExclusiveRegion
	self
		assertLock: (self regionLockFrom: 10 to: 20 exclusive: true)
		lock: (self regionLockFrom: 20 to: 30 exclusive: true)
		conflicts: true