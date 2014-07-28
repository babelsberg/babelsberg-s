version dependent
fileExists: path
	"Answer true if a file of the given name exists. The given name may be
	either a full path name or a local file within this directory."

	^ self useFileSystem
		ifTrue: [ (path perform: #asFileReference) exists ]
		ifFalse: [ (Smalltalk at: #FileDirectory) default fileExists: path ]
