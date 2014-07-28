initialize-release
initializeThisOSProcess
	"Initialize the singleton instance, creating a new instance only if the
	platform type has changed since shutdown (running on a different
	type of computer)."

	(ThisInstance isNil or: [ThisInstance isResponsibleForThisPlatform not])
		ifTrue: [ | cls |
			(cls := self concreteClassOrNil)
				ifNil: [ThisInstance := nil "no concrete class for this platform"]
				ifNotNil: [ThisInstance := cls basicNew]].
	ThisInstance initialize