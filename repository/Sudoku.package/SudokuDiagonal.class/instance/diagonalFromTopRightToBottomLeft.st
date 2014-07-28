accessing
diagonalFromTopRightToBottomLeft
	"This method returns a new collection of all cells in the diagonal."
	| diagonal |
	diagonal := Array new: nrows.
	(1 to: nrows)
		do: [:i | diagonal at: i put: (self at: i at: nrows-i+1)].
	^ diagonal