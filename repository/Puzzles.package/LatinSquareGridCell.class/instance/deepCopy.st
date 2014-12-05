copying
deepCopy

	| newObject |
	newObject := self class new.
	newObject
		grid: self grid;
		x: self x;
		y: self y.
	^ newObject