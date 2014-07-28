testing
testEntireExclusiveWithSharedRegion
	self
		assertLock: self entireExclusiveLock
		lock: self regionSharedLock
		conflicts: true