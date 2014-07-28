updating
update: aParameter 

	| accessible |
	aParameter == #runState
		ifTrue: [| statusArray | 
			"Has the process exited?"
			statusArray := self accessor primGetChildExitStatus: self pid.
			statusArray notNil
				ifTrue: [self exitStatus: (statusArray at: 2).
						^ self complete]].
	aParameter == #accessibility
		ifTrue: ["Does the process still exist, and is it reachable?"
			((accessible := self isAccessible) notNil and: [accessible])
				ifFalse: [^ self isRunning ifTrue: [self unknownRunState]]].
	super update: aParameter
