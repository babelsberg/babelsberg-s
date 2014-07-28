concrete subclasses
concreteClass

	"ExternalOSProcess concreteClass"

	^ self subclasses
		detect: [:c | c isResponsibleForThisPlatform]
		ifNone: [self notify: self printString,
					': No concrete class implementation available for system type ',
					self platformName printString.
				nil]

