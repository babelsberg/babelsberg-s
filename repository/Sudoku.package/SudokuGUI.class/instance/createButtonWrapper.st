initialization
createButtonWrapper

	buttonWrapper := RectangleMorph new. 
	buttonWrapper 	
		layoutPolicy: TableLayout new;
		listDirection: #leftToRight;
		hResizing: #spaceFill;
		vResizing: #spaceFill;
		borderWidth: 3;
		borderColor: Color black;
		cellInset: 3;
		color: Color black.