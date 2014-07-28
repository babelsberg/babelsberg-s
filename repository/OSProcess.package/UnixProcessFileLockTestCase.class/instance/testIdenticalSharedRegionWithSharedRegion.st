testing
testIdenticalSharedRegionWithSharedRegion
	self
		assertLock: self regionSharedLock
		lock: self regionSharedLock
		conflicts: false