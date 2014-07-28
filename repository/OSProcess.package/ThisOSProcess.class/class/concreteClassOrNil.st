concrete subclasses
concreteClassOrNil

	"ThisOSProcess concreteClassOrNil"

	^ self subclasses
		detect: [:c | c isResponsibleForThisPlatform]
		ifNone: [nil]

