initialization
initializeCellSize: cellSize textSize: textSize
	| textMorph |
	super initialize.
	self
		layoutPolicy: TableLayout new;
		color: Color white;
		borderWidth: 0;
		width: cellSize;
		height: cellSize;
		disableDragNDrop;
		listCentering: #center;
		wrapCentering: #center.
		
	textMorph := TextMorph new
		borderWidth: 0; 
		width: cellSize/2;
		height: cellSize/2;
		beAllFont: (((TextStyle named: 'BitstreamVeraSans') fontOfSize: textSize) emphasized: 1);
		disableDragNDrop;
		contents: ' ';
		centered.

	self addMorph: textMorph.