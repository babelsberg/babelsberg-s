instance creation
forThisOSProcess
	"Answer a single instance corresponding to the OS process in which this 
	Smalltalk image is executing."

	"OSProcessAccessor forThisOSProcess"

	ThisOSProcessAccessor
		ifNotNil: [ThisOSProcessAccessor isResponsibleForThisPlatform
					ifTrue:
						["Common case, platform has not changed"
						^ThisOSProcessAccessor ]
					ifFalse:
						["We are running on a different platform, so start a new accessor"
						ThisOSProcessAccessor changed: #invalidProcessAccessor.
						ThisOSProcessAccessor finalize]].
	^ ThisOSProcessAccessor := self concreteClass basicNew initialize
