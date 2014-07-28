testing
testEntireSharedWithExclusiveRegion
	self
		assertLock: self entireSharedLock
		lock: self regionExclusiveLock
		conflicts: true