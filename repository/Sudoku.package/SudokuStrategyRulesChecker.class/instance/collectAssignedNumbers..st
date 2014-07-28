solving
collectAssignedNumbers: aCollection
	| assignedNumbers |
	assignedNumbers := OrderedCollection new.
	aCollection collect: 
			[:candidateList | (candidateList size == 1) 
								ifTrue: [assignedNumbers add: candidateList first]].
	^ assignedNumbers 