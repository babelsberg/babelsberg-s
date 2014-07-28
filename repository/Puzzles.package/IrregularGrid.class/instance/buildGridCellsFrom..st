initialize-release
buildGridCellsFrom: aCharacterList

	"self := Matrix new: self rowCount tabulate: [:i :j | aCharacterList at: (j \\ 10 + (i-1*9))]."
	(1 to: self rowCount) do: [:row |
		(1 to: self columnCount) do: [:column |
			self at: row at: column put: 
				(self class cellClass new 
					regionId: (aCharacterList at: (column \\ 10 + (row-1*9)));
					grid: self;
					x: row; y: column)]].