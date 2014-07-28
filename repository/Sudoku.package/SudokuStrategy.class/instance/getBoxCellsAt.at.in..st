accessing
getBoxCellsAt: i at: j in: aMatrix
	| cells |
	cells := OrderedCollection new.
	0 to: 2 do:
		[:x | 0 to: 2 do:
			[:y | cells add: (aMatrix at: i+x at: j+y)]].
	^ cells