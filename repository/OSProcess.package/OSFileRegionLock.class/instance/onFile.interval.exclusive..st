initialize-release
onFile: aFileStream interval: anInterval exclusive: writeLockFlag

	self onFile: aFileStream exclusive: writeLockFlag.
	self interval: anInterval.