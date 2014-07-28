updating
changeColorOfDiagonalCellsTo: aColor

	(1 to: 9) do: 
		[:i |	(self cellAtX: i Y: i) color: aColor.
			(self cellAtX: i Y: 9-i+1) color: aColor].