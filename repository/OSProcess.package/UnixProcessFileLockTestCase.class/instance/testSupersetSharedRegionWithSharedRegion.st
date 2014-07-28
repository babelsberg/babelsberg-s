testing
testSupersetSharedRegionWithSharedRegion
	self
		assertLock: (self regionLockFrom: 10 to: 40 exclusive: false)
		lock: (self regionLockFrom: 20 to: 30 exclusive: false)
		conflicts: false