conflict testing
conflictsWith: otherFileLock
	^ (self isExclusive or: [otherFileLock isExclusive])
		and: [self overlaps: otherFileLock]