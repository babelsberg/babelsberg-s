initialization
createLine: aString
	| line |
	
	line := TextMorph new.
	line
		beAllFont: (((TextStyle named: 'BitstreamVeraSans') fontOfSize: 24) emphasized: 1);
		contents: aString;
		backgroundColor: Color white;
		autoFit: False;
		hResizing: #spaceFill;
		disableDragNDrop.
	
	textLines add: line.