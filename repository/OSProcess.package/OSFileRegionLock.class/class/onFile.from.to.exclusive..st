instance creation
onFile: aFileStream from: start to: end exclusive: writeLockFlag
	"A region representing part of a file"

	^ self onFile: aFileStream interval: (start to: end) exclusive: writeLockFlag
