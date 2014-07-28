testing
testIdenticalSharedRegionWithExclusiveRegion
	self
		assertLock: self regionSharedLock
		lock: self regionExclusiveLock
		conflicts: true