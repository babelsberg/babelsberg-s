instance creation
newConstrainedPuzzle

	| puzzle |
	puzzle := self newWithPentominoes: {$u. $x. $i. $l. $t. $y} size: 5@6.
	puzzle createConstraints.
	puzzle prettyDraw openInWorld.
	^ puzzle