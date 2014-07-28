updating
update: aParameter 

	| accessible stat |
	aParameter == #runState
		ifTrue:
			["Has the process exited?"
	 		stat := self accessor primGetExitStatusForHandle: self handle.
			stat ifNotNil: [self complete closeHandles exitStatus: stat]].
	aParameter == #accessibility
		ifTrue: ["Does the process still exist, and is it reachable?"
			((accessible := self isAccessible) notNil and: [accessible])
				ifFalse: [self isRunning ifTrue: [self unknownRunState]]].
	super update: aParameter
