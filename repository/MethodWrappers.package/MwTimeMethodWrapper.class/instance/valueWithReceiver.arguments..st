evaluating
valueWithReceiver: anObject arguments: argumentsArray
	"This method was overriden so that recursive calls will have a different beginTime."

	| beginTime |
	beginTime := Time millisecondClockValue.
	self count: self count + 1.
	^ [
		self clientMethod valueWithReceiver: anObject arguments: argumentsArray
	] ensure: [self time: self time + (Time millisecondClockValue - beginTime max: 0)]