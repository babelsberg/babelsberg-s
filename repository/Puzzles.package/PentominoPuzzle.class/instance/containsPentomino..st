testing
containsPentomino: aSymbol

	| base pentominoId pointsStartIndex |
	pentominoId := (self pentominoNames indexOf: aSymbol).
	base := self pentominoStartingPoints at: pentominoId.
	pointsStartIndex := pentominoId-1 * 5 +1.
	(self class pentominoDeltaDict at: aSymbol) withIndexDo: [:delta :index | (self allPoints at: (pointsStartIndex+index-1)) = (base + delta) 
		ifFalse: [^ false]].
	^ true