file locking
lockFile: fileStream from: start to: end exclusive: writeLockFlag ifFail: failBlock

	| lock |
	lock := OSFileRegionLock onFile: fileStream from: start to: end exclusive: writeLockFlag.
	^ self lockFileRegion: lock ifFail: [failBlock value]