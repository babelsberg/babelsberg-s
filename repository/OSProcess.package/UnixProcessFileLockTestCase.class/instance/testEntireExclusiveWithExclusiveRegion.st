testing
testEntireExclusiveWithExclusiveRegion
	self
		assertLock: self entireExclusiveLock
		lock: self regionExclusiveLock
		conflicts: true