standard IO handles
setStdIn: aFileStream
	"Set the standard input handle for this OSProcess to be that of aFileStream"

	"| fs |
	fs := FileStream fileNamed: 'stdInput.tmp'.
	fs nextPutAll: 'this is a line of text'; cr.
	fs position: 0.
	OSProcess accessor setStdIn: fs"

	| sqFile |
	aFileStream ifNil: [^ false].
	sqFile := UseIOHandle
				ifTrue: [aFileStream ioHandle handle]
				ifFalse: [aFileStream fileID].
	^ self primSetStdIn: sqFile
