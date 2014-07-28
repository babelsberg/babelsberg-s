accessing
processAccessor

	| a |
	processAccessor
		ifNil: 
			[a := OSProcessAccessor forThisOSProcess.
			a isResponsibleForThisPlatform ifTrue:
				[processAccessor := a.
				processAccessor addDependent: self]].
	^ processAccessor