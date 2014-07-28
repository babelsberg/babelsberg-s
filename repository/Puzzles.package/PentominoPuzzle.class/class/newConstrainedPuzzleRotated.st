instance creation
newConstrainedPuzzleRotated

	| puzzle |
	puzzle := self newWithPentominoes: {$u. $x. $i. $l. $t. $y} size: 5@6.
	puzzle createConstraintsRotated.
	puzzle prettyDraw openInWorld.
	^ puzzle