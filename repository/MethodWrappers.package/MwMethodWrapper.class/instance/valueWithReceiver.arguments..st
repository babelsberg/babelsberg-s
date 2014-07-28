evaluating
valueWithReceiver: anObject arguments: anArrayOfObjects
	"This is the general case where you want both a before and after method, but if you
	want just a before method, you might want to override this method for optimization."

	self beforeMethod.
	^ [
		self clientMethod valueWithReceiver: anObject arguments: anArrayOfObjects.
	] ensure: [self afterMethod]