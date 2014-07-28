file locking
unlockFile: fileStream from: start to: end ifFail: failBlock

	^ self unlockFile: fileStream from: start to: end exclusive: true ifFail: failBlock
