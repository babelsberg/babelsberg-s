solving
removeCandidatesForPairs: aCollectionOfPairs in: aCollectionOfCandidateLists
	aCollectionOfPairs do:
		[:pair | aCollectionOfCandidateLists do:
			[:candidates | (pair asSet = candidates asSet)
								ifFalse: [(candidates includesAnyOf: pair)
											ifTrue: [solvedCells := true.
													candidates removeAllFoundIn: pair]]]].