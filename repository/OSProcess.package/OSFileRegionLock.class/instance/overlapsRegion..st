comparing
overlapsRegion: aFileRegionLock
	^ (super overlapsRegion: aFileRegionLock) and: [(self interval intersection: aFileRegionLock interval) isEmpty not]