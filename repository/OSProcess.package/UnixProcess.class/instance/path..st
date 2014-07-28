accessing
path: aPathString

	self environmentAt: #PATH put: aPathString.
	path := self pathString