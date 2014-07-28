initialization
createPlayPauseButton: sudokuSolver
	"This method creates a button that is used to take steps of solving the Sudoku until pause is pressed."
	
	playButton := SudokuPlayButton new.
	playButton  
		sudokuSolver: sudokuSolver;
		actionSelector: #playOrPause;
		target: playButton;
		layoutPolicy: TableLayout new;
		color: Color white;
		hResizing: #spaceFill;
		vResizing: #spaceFill;
		layoutInset: 10;
		wrapCentering: #center.
		
	playButton 
		playForm: (Form fromFileNamed: 'Play.png');
		pauseForm: (Form fromFileNamed: 'Pause.png').