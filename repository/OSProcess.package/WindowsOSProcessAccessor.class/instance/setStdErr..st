standard IO handles
setStdErr: aFileStream
	"Set the standard error handle for this OSProcess to be that of aFileStream"

	"| fs |
	fs := FileStream fileNamed: 'stdError.tmp'.
	OSProcess accessor setStdErr: fs"

	| sqFile |
	aFileStream ifNil: [^ false].
	sqFile := UseIOHandle
				ifTrue: [aFileStream ioHandle handle]
				ifFalse: [aFileStream fileID].
	^ self primSetStdErr: sqFile
