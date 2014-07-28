accessing
allRotationsOfPentomino: aSymbol
	"This returns all four rotations, although some pentominoes are symmetric."
	| deltaList rotationLists |
	deltaList := self pentominoDeltaDict at: aSymbol.
	rotationLists := Array new: 4.
	rotationLists at: 1 put: deltaList.
	rotationLists at: 2 put: (deltaList collect: [:pt | pt leftRotated]).
	rotationLists at: 3 put: (deltaList collect: [:pt | pt rightRotated]).
	rotationLists at: 4 put: (deltaList collect: [:pt | pt leftRotated leftRotated]).
	^ rotationLists