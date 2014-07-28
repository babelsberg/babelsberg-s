instance creation
newConstrainedPuzzleWithPentominoes: aCharacterArray size: aPoint

	| puzzle |
	puzzle := self newWithPentominoes: aCharacterArray size: aPoint.
	puzzle createConstraints.
	puzzle prettyDraw openInWorld.
	^ puzzle