initialization
initializeThisMorph

	self
		layoutPolicy: TableLayout new;
		listDirection: #leftToRight;
		hResizing: #shrinkWrap;
		vResizing: #shrinkWrap;
		borderWidth: 5;
		cellInset: 0;
		borderColor: Color black;
		color: Color black.