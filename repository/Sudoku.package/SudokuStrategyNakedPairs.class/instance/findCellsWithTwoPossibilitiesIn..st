solving
findCellsWithTwoPossibilitiesIn: aCollection
	^ aCollection select: [:candidates | candidates size = 2].