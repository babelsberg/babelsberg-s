accessing
leftNeighborOfX: x y: y

	y = 1 ifTrue: [^'' asCharacter].
	^ (self at: x at: y-1) regionId
	