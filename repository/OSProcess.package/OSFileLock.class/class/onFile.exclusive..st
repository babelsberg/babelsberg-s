instance creation
onFile: aFileStream exclusive: writeLockFlag
	"A region representing the whole file"

	^ super new onFile: aFileStream exclusive: writeLockFlag
