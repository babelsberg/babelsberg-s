comparing
= aFileRegion

	^ (super = aFileRegion) and: [self interval = aFileRegion interval]
