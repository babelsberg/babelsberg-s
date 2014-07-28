testing
testDistinctSharedRegionWithSharedRegion
	self
		assertLock: (self regionLockFrom: 10 to: 20 exclusive: false)
		lock: (self regionLockFrom: 30 to: 40 exclusive: false)
		conflicts: false