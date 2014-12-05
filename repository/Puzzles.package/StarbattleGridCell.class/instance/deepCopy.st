copying
deepCopy

	| newObject |
	newObject := super deepCopy.
	newObject isStar: self isStar deepCopy.
	^ newObject