solving
initialCandidates

	| allCandidates candidates puzzleSize |
	allCandidates := OrderedCollection new.
	0 to: 1 do: [:i | allCandidates add: i].

	puzzleSize := self rowCount.
	candidates := self copy.
	1 to: puzzleSize do:
		[:i | 1 to: puzzleSize do:
			[:j | (candidates at: i at: j) isStar: allCandidates copy]].

	^ candidates