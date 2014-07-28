testing
testIdenticalExclusiveRegionWithExclusiveRegion
	self
		assertLock: self regionExclusiveLock
		lock: self regionExclusiveLock
		conflicts: true