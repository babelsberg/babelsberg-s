testing
testEntireSharedWithEntireExclusive
	self
		assertLock: self entireSharedLock
		lock: self entireExclusiveLock
		conflicts: true