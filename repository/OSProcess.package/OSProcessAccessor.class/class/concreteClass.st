concrete subclasses
concreteClass

	"OSProcessAccessor concreteClass"

	^ self subclasses
		detect: [:c | c isResponsibleForThisPlatform]
		ifNone: [self notify: self printString,
					': No concrete class implementation available for system type ',
					OSProcess platformName printString.
				nil]

