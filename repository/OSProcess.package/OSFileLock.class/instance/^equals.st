comparing
= aFileLock
	^ ((self species = aFileLock species)
		and: [self fileStream == aFileLock fileStream])
			and: [self exclusive == aFileLock exclusive]