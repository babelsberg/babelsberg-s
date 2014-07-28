environment
path
	"Newer versions of Windows mixed case"

	^ self environment
		at: #PATH
		ifAbsent: [environment
				at: #Path
				ifAbsent: ['']]