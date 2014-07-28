version testing
versionInformation

	"OSProcess versionInformation"

	| osppVersion |
	osppVersion := (Smalltalk hasClassNamed: #OSProcessPlugin)
		ifTrue:
			[(Smalltalk at: #OSProcessPlugin) versionInformation]
		ifFalse:
			['(not installed in this image)'].
	^ Array
		with: (self name, ' version ', self versionString)
		with: ((Smalltalk hasClassNamed: #CommandShell)
				ifTrue:
					[((Smalltalk at: #CommandShell) respondsTo: #versionString)
						ifTrue:
							['CommandShell version ', (Smalltalk at: #CommandShell) versionString]
						ifFalse:
							['CommandShell installed (old version, no versionString)']]
				ifFalse:
					['CommandShell is not installed'])
		with:  osppVersion
