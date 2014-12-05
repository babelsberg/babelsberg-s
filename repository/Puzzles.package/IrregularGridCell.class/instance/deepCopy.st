copying
deepCopy

	| newObject |
	newObject := super deepCopy.
	newObject
		regionId: self regionId;
		content: self content deepCopy.
	^ newObject