initialization
initialize

	| style |
	super initialize.
	style := IrregularGridBorderStyle new.
	style width: 1.
	style color: Color black.
	self 
		borderStyle: style;
		color: Color white;
		width: 77; height: 77.