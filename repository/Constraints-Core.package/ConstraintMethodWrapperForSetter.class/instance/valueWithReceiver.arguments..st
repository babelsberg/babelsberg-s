evaluating
valueWithReceiver: anObject arguments: anArrayOfObjects

	| constraintVariable |
	constraintVariable := self getMethod valueWithReceiver: anObject arguments: anArrayOfObjects allButLast.
	constraintVariable suggestValue: anArrayOfObjects last.