testing
testExclusiveRegionWithExclusiveRegion
	self
		assertLock: self regionExclusiveLock
		lock: self regionExclusiveLock
		conflicts: true