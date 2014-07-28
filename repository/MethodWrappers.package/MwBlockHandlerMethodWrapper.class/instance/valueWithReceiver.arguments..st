evaluating
valueWithReceiver: anObject arguments: anArrayOfObjects

	^ [
		self clientMethod valueWithReceiver: anObject arguments: anArrayOfObjects.
	] on: self exception do: [:ex |
		self handlerBlock copy fixTemps value: anObject value: anArrayOfObjects value: ex]