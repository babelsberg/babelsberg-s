testing
testEntireSharedWithSharedRegion
	self
		assertLock: self entireSharedLock
		lock: self regionSharedLock
		conflicts: false