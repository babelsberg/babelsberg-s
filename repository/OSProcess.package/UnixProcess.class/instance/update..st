updating
update: aParameter
	"Framework to update some or all of the instance variables based on external events,
	such as receipt of a sigchd signal when a child process exits."

	(aParameter == (self processAccessor)) ifTrue:
		[^ self refreshFromProcessAccessor; yourself].
	(aParameter == #pid) ifTrue:
		[^ self resetChildProcessDictionary. "Forget children of prior process"].
	(aParameter == #childProcessStatus) ifTrue:
		[^ self updateActiveChildren; changed; yourself].
	(aParameter == #startUp) ifTrue:
		[^ self update: #pid].
	aParameter == #invalidProcessAccessor ifTrue:
		[processAccessor := processAccessor ifNotNil: [processAccessor removeDependent: self. nil].
		^ self].
	self error: 'Unexpected update parameter'