initialization
initializeCellSize: cellSize textSize: textSize updateColor: aColor1 normalColor: aColor2 highlightColor: aColor3 removeColor: aColor4
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
		
	textMorph := SudokuTextMorph new
		borderWidth: 0; 
		width: cellSize/2;
		height: cellSize/2;
		beAllFont: (((TextStyle named: 'BitstreamVeraSans') fontOfSize: textSize) emphasized: 1);
		disableDragNDrop;
		setNumericValue: 0;
		normalColor: aColor2;
		updateColor: aColor1;
		highlightColor: aColor3;
		removeCandidatesColor: aColor4;
		centered.

	self addMorph: textMorph.