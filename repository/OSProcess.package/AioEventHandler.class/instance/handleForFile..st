private
handleForFile: aFileStream

	"self new handleForFile: SourceFiles first"

	| ioHandle |
	ioHandle := self useIOHandle
		ifTrue: [aFileStream ioHandle]
		ifFalse: [aFileStream fileID].
	^ self primOSFileHandle: ioHandle
