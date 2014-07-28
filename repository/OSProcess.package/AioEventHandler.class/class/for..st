instance creation
for: aSocketOrFileStream

	"self for: SourceFiles first"
	"self for: Socket new"
	"self for: OSProcess thisOSProcess stdIn"

	^ self new for: aSocketOrFileStream