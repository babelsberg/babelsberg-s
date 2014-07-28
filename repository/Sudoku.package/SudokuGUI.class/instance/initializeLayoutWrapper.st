initialization
initializeLayoutWrapper

	layoutWrapper := Morph new. 
	layoutWrapper 	
		layoutPolicy: TableLayout new;
		listDirection: #topToBottom;
		hResizing: #spaceFill;
		vResizing: #spaceFill;
		layoutInset: 0;
		cellInset: 0;
		borderWidth: 0;
		color: Color orange.