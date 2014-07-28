initialization
createHintButton
	"This method creates a help button. If the use clicks on it, a random number (of a valid solution) will be given."
	hintButton := SimpleButtonMorph new.
	hintButton 
		actionSelector: #giveHint;
		target: self;
		label: 'Give a hint' font: (((TextStyle named: 'BitstreamVeraSans') 
							    				fontOfSize: 36) emphasized: 1);
		layoutPolicy: TableLayout new;
		color: Color white;
		hResizing: #spaceFill;
		vResizing: #spaceFill;
		layoutInset: 10;
		wrapCentering: #center.
	
	