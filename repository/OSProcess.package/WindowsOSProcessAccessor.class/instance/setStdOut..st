standard IO handles
setStdOut: aFileStream
	"Set the standard output handle for this OSProcess to be that of aFileStream"

	"| fs |
	fs := FileStream fileNamed: 'stdOutput.tmp'.
	OSProcess accessor setStdOut: fs"

	| sqFile |
	aFileStream ifNil: [^ false].
	sqFile := UseIOHandle
				ifTrue: [aFileStream ioHandle handle]
				ifFalse: [aFileStream fileID].
	^ self primSetStdOut: sqFile
