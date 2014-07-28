solving
removeCandidatesInCell: aCollection hiddenSingle: aNumber
	solvedCells := solvedCells or: [aCollection size > 1].
	aCollection removeAllSuchThat: [:number | (number = aNumber) not].