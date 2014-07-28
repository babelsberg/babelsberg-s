solving
removeAssignedNumbers: numbers from: aCollection
"If at least one candidate is removed, solvedCells is true."
	aCollection do: [:candidateList | (candidateList size == 1)
										ifFalse: [solvedCells := solvedCells or: [candidateList includesAnyOf: numbers]. 
											candidateList removeAllFoundIn: numbers]].