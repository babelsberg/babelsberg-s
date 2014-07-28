environment
environmentAt: aSymbol put: aString
	"Set an environment variable for the external OS process, and update the dictionary in
	this Smalltalk object."

	| s |
	self initialize.
	s := self processAccessor environmentAt: aSymbol put: aString.
	s ifNotNil: [ self environment at: aSymbol asSymbol put: aString ].
	^ s

