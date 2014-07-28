instance creation
getCandidatesMatrixFrom: aMatrix

	| allCandidates candidates |
	allCandidates := OrderedCollection new.
	1 to: 9 do:
		[:i | allCandidates add: i].
	
	candidates := Matrix new: 9.
	1 to: 9 do:
		[:i | 1 to: 9 do:
			[:j | ((aMatrix at: i at: j) = 0)
					ifTrue: [candidates at: i at: j put: allCandidates copy]
					ifFalse: [candidates at: i at: j put: (OrderedCollection with: (aMatrix at: i at: j))]]].

	^ candidates