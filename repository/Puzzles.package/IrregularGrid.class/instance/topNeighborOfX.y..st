accessing
topNeighborOfX: x y: y

	x = 1 ifTrue: [^'' asCharacter].
	^ (self at: x-1 at: y) regionId
	