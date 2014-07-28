initialization
initialize

	super initialize.
	
	self 
		initializeThisMorph;
		initializeGrid;
		initializeLayoutWrapper.
		
	layoutWrapper addMorph: grid.
	self addMorph: layoutWrapper.

	sudokuCellDict := Dictionary new.