initialization
createCellsFrom: aMorph
	"This method creates all cells of an irregular grid. Each cell is like the given morph."
	| row grid |
	row := RectangleMorph new
		layoutPolicy: TableLayout new;
		listDirection: #leftToRight;
		hResizing: #spaceFill;
		vResizing: #spaceFill;
		borderWidth: 0;
		layoutInset: 0;
		cellInset: 0;
		color: Color transparent;
		disableDragNDrop.
	9 timesRepeat: [row addMorph: aMorph copy].

	grid := RectangleMorph new
		layoutPolicy: TableLayout new;
		listDirection: #topToBottom;
		hResizing: #spaceFill;
		vResizing: #spaceFill;
		borderWidth: 0;
		layoutInset: 0;
		cellInset: 0;
		color: Color gray lighter;
		disableDragNDrop.
	9 timesRepeat: [grid addMorph: row copy].

	^ grid