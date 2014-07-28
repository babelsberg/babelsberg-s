accessing
rightNeighborOfX: x y: y

	y = self columnCount ifTrue: [^'' asCharacter].
	^ (self at: x at: y+1) regionId
	