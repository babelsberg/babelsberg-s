environment
environmentAt: aSymbol
	"Answer an environment variable for the external OS process, and update the dictionary
	in this Smalltalk object."

	^ environment at: aSymbol asSymbol ifAbsent: []
