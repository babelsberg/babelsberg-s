instance creation
onFile: aFileStream interval: anInterval exclusive: writeLockFlag
	"A region representing part of a file"

	^ super new onFile: aFileStream interval: anInterval exclusive: writeLockFlag
