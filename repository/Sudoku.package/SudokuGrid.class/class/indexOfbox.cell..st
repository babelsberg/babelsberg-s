accessing
indexOfbox: boxIndex cell: cellIndex
	^ ((self topLeftCellOfBox: boxIndex) x + (cellIndex-1 // 3))
		@ ((self topLeftCellOfBox: boxIndex) y + (cellIndex-1 \\ 3))