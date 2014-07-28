initialization
initialize

	super superInitialize.
 	self ui setupUi: self.
	grid := self ui grid grid.
	sudokuCellDict := self ui grid sudokuCellDict.
	numbers := self ui grid numbers.
	layoutWrapper := self ui grid layoutWrapper.
	buttonWrapper := self ui grid buttonWrapper.