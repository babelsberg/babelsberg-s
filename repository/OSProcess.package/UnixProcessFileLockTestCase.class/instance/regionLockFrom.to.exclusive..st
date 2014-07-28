data
regionLockFrom: from to: to exclusive: exclusive
	^ OSFileRegionLock onFile: self fileStream from: from to: to exclusive: exclusive