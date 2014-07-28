testing
testIrregularGridRegion

	| starbattle region |
	starbattle := IrregularGrid newFromFile: 'starbattle.txt'.
	
	self shouldnt: [region := starbattle regionWithIdentifier: 'g' asCharacter] raise: Error.
	self should: [region size = 6].
	
	self shouldnt: [region := starbattle regionWithIdentifier: 'e' asCharacter] raise: Error.
	self should: [region size = 15].