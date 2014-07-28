testing
testEntireSharedWithEntireShared
	self
		assertLock: self entireSharedLock
		lock: self entireSharedLock
		conflicts: false