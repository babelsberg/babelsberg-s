version dependent
defaultPathString

	^ self useFileSystem
		ifTrue: [(((Smalltalk at: #Path) perform: #workingDirectory) perform: #asFileReference) pathString]
		ifFalse: [(Smalltalk at: #FileDirectory) default pathName]
