testing
testIrregularGridRegion

	| starbattle region |
	starbattle := IrregularGrid buildFromString: IrregularGrid defaultInputFile.
	
	self shouldnt: [region := starbattle regionWithIdentifier: 'g' asCharacter] raise: Error.
	self should: [region size = 6].
	
	self shouldnt: [region := starbattle regionWithIdentifier: 'e' asCharacter] raise: Error.
	self should: [region size = 15].