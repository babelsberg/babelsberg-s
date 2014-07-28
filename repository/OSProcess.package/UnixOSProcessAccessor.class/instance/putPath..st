external process access
putPath: aString
	"Convenience method. Set the environment PATH variable to aString."

	| pathString |
	pathString := 'PATH=', aString, ((Character value: 0) asString). 
	^ self environmentPut: pathString




