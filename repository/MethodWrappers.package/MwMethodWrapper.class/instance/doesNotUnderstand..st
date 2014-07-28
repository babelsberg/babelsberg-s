initialization
doesNotUnderstand: aMessage
	"required for all meta messages that need information from the original method"
	(self clientMethod isNil and: [aMessage selector == #flushCache]) ifTrue: [^ self].
	^ aMessage sendTo: self clientMethod.