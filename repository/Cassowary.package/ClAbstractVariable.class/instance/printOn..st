printing
printOn: aStream
	"Prints a semi-descriptive representation to the stream, using the name if there is one, and otherwise the hash number of this object.

	Examples:
		x[10.0]			- with name
		x[0.0, 100]		- with name/bounds, but no value yet
		CV#345(10.0)	- without name"

	self name 
		ifNil: [aStream nextPutAll: 'CV#', self hash printString]
		ifNotNil: [aStream nextPutAll: self name].