evaluating
valueWithReceiver: anObject arguments: anArrayOfObjects
	"This is the general case where you want both a before and after block, but if you
	want just a before block, you might want to override this method for optimization."

	self beforeBlock copy fixTemps value: anObject value: anArrayOfObjects.
	^ [
		self clientMethod valueWithReceiver: anObject arguments: anArrayOfObjects.
	] ensure: [self afterBlock copy fixTemps value: anObject value: anArrayOfObjects]