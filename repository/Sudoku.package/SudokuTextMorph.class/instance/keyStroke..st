event handling
keyStroke: anEvent
	"This method handles a keystroke event. 
	If the user input is a number between 1 and 9, the new number is suggested to the sudoku model. If the sudoku is satisfiable, the cell text is updated.
	If the user input is an arrow key, the keyboard focus is moved to the next cell in the given direction.
	If the user input is <delete> or <backspace>, the current number will be deleted."
	| numberFromAsciiInput |
	numberFromAsciiInput := anEvent keyValue - 48.
	(numberFromAsciiInput between: 1 and: 9) 
		ifTrue: ["try solving, set number if possible" 
				[self owner suggestNewValueToSudokuModel: numberFromAsciiInput] 
					ifError: [self inform: 'The input value ', numberFromAsciiInput, ' made the Sudoku unsatisfiable.'. 
							self keyboardFocusChange: false.
							^ self].
				self updateTextWith: numberFromAsciiInput.
				^ self].

	"navigate on arrow keys"
	(anEvent keyCharacter = Character arrowDown)
		ifTrue: [self owner moveFocusBy: 1@0 event: anEvent. ^ self].
	(anEvent keyCharacter = Character arrowUp)
		ifTrue: [self owner moveFocusBy: -1@0 event: anEvent. ^ self].
	(anEvent keyCharacter = Character arrowLeft)
		ifTrue: [self owner moveFocusBy: 0@(-1) event: anEvent. ^ self].
	(anEvent keyCharacter = Character arrowRight)
		ifTrue: [self owner moveFocusBy: 0@1 event: anEvent. ^ self].

	(anEvent keyCharacter = Character backspace
		or: [anEvent keyCharacter = Character delete])
			ifTrue: ["delete number in SudokuGrid"
					(self text = '') ifTrue: [^ self].
					self owner deleteNumberInSudokuModel.
					self updateColor: Color blue.
					^ self updateTextWith: ''].

	self inform: 'Invalid input for a Sudoku: ', anEvent keyString, '. Please enter a number between 1 and 9.'.
	self keyboardFocusChange: false.
	