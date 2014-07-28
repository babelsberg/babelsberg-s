initialization
initialize

	super initialize.
	textLines := OrderedCollection new.
	self 
		layoutPolicy: TableLayout new;
		listDirection: #topToBottom;
		hResizing: #rigid;
		vResizing: #spaceFill;
		width: 300;
		wrapCentering: #topLeft;
		layoutInset: 10;
		borderWidth: 3;
		borderColor: Color black;
		color: Color white;
		disableDragNDrop.
		
	
		