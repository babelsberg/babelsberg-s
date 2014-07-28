initialize-release
initializeThisOSProcessWithNotifier
	"Initialize the singleton instance, creating a new instance only if the
	platform type has changed since shutdown (running on a different
	type of computer). Warn if no implementation is available for this platform."

	(ThisInstance isNil or: [ThisInstance isResponsibleForThisPlatform not])
		ifTrue: [ThisInstance := self concreteClass basicNew].
	ThisInstance initialize