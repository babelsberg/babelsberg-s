version dependent
deleteFileNamed: fileName
	"Delete the file with the given name."

	self useFileSystem
		ifTrue: [ | file |
			file := fileName perform: #asFileReference.
			( {	#ensureDelete "preferred selector" .
				#ensureDeleted "pharo 2, now deprecated in favor of ensureDelete" .
				#delete "fallback (earlier pharo versions?)" }
					detect: [ :e | file respondsTo: e ]
					ifNone: [ self error: 'do not know how to ensureDelete' ] )
				ifNotNilDo: [ :sel | file perform: sel ].
			(file respondsTo: #ensureDelete)
				ifTrue: [ file perform: #ensureDelete ]
				ifFalse: [ file perform: #ensureDeleted ] ]
		ifFalse: [ (Smalltalk at: #FileDirectory) default
				deleteFileNamed: fileName ]
