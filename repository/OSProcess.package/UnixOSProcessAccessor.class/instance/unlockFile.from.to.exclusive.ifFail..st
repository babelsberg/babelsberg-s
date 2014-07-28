file locking
unlockFile: fileStream from: start to: end exclusive: writeLockFlag ifFail: failBlock

	| lock |
	lock := OSFileRegionLock onFile: fileStream from: start to: end exclusive: writeLockFlag.
	^ self unlockFileRegion: lock ifFail: [failBlock value]