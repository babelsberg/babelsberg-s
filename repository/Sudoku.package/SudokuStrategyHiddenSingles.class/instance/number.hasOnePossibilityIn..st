solving
number: aNumber hasOnePossibilityIn: aCollection
"This method checks whether aNumber can only be in one cell of aCollection. If that is the case, the index of that cell will be returned. Otherwise, this method returns 0."
	| numberOfPossibleCells indexOfCell |
	numberOfPossibleCells := 0.
	indexOfCell := 0.
	aCollection withIndexDo: 
		[:candidates :index | (candidates size = 1 and: [candidates includes: aNumber])
								ifTrue: [^ 0].  
							(candidates includes: aNumber)
								ifTrue: [	numberOfPossibleCells := numberOfPossibleCells + 1. 
										indexOfCell := index]].
					
	(numberOfPossibleCells = 1)
		ifFalse: [indexOfCell := 0].
		
	^ indexOfCell