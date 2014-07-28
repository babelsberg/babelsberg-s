testing
containsPentominoRotated: aSymbol

	| base pentominoId pointsStartIndex allRotationsExpression |
	pentominoId := (self pentominoNames indexOf: aSymbol).
	base := self pentominoStartingPoints at: pentominoId.
	pointsStartIndex := pentominoId-1 * 5 +1.

	allRotationsExpression := nil.
	(self class allRotationsOfPentomino: aSymbol) do: [:deltaList | | oneRotationExpression |
		oneRotationExpression := nil.
		deltaList withIndexDo: [:delta :index | | samePoint |
			samePoint := (self allPoints at: (pointsStartIndex+index-1)) = (base + delta).
			oneRotationExpression
				ifNil: [oneRotationExpression := samePoint]
				ifNotNil: [oneRotationExpression := oneRotationExpression & samePoint]].
		allRotationsExpression
			ifNil: [allRotationsExpression := oneRotationExpression]
			ifNotNil: [allRotationsExpression := allRotationsExpression | oneRotationExpression]].
	^ allRotationsExpression