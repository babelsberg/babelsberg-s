testing
testSupersetExclusiveRegionWithExclusiveRegion
	self
		assertLock: (self regionLockFrom: 10 to: 40 exclusive: true)
		lock: (self regionLockFrom: 20 to: 30 exclusive: true)
		conflicts: true