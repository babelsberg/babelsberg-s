accessing boxes
atBox: index
	"This method returns a new collection of all cells in the box at index."
	| box topLeftIndex |
	(index between: 1 and: nrows)
		ifFalse: [self error: 'box subscript out of range'].
	box := Array new: nrows.
	topLeftIndex := self class topLeftCellOfBox: index.
	0 to: 2 do:
		[:x | 0 to: 2 do:
			[:y | box at: (x*3 + y + 1) put: (self at: topLeftIndex x + x at: topLeftIndex y + y)]].
	^ box