accessing
boxNumberFromIndex: aPoint
	| xBox yBox |
	xBox := aPoint x - 1 // 3.
	yBox := aPoint y - 1 // 3.
	^ xBox * 3 + yBox + 1