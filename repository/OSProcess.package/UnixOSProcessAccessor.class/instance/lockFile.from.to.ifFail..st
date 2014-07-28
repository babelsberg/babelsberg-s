file locking
lockFile: fileStream from: start to: end ifFail: failBlock

	^ self lockFile: fileStream from: start to: end exclusive: true ifFail: failBlock
