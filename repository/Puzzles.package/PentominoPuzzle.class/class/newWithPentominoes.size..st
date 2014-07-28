instance creation
newWithPentominoes: aCharacterArray size: aPoint

	| p start |
	p := PentominoPuzzle new.
	start := PuzzlePoint new x: 1; y: 1.
	p
		rowCount: aPoint x;
		columnCount: aPoint y;
		allPoints: (Array new: p rowCount * p columnCount);
		pentominoNames: aCharacterArray.

	(1 to: p allPoints size / 5) do: [:i | p pentominoStartingPoints add: start copy]. 
	(1 to: p allPoints size) do: [:i | p allPoints at: i put: start copy].

	^ p