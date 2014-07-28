testing
testEntireExclusiveWithEntireExclusive
	self
		assertLock: self entireExclusiveLock
		lock: self entireExclusiveLock
		conflicts: true