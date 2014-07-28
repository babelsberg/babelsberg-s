building
createTableOfThreeCellsWithDirection: aSymbol fromMorph: aMorph
	"This method creates three cells in a row (aSymbol = #leftToRight) or column (aSymbol = #topToBottom)."
	| table |
	
	table := RectangleMorph new
		layoutPolicy: TableLayout new;
		listDirection: aSymbol;
		hResizing: #shrinkWrap;
		vResizing: #shrinkWrap;
		borderWidth: 0;
		layoutInset: 0;
		color: Color black;
		disableDragNDrop.
	3 timesRepeat: [table addMorph: aMorph copy].
	^ table