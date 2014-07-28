accessing
bottomNeighborOfX: x y: y

	x = self rowCount ifTrue: [^'' asCharacter].
	^ (self at: x+1 at: y) regionId
	