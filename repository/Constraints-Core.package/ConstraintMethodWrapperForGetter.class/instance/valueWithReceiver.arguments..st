evaluating
valueWithReceiver: anObject arguments: anArrayOfObjects

	| returnValue |
	returnValue := self clientMethod valueWithReceiver: anObject arguments: anArrayOfObjects.
	^ returnValue value