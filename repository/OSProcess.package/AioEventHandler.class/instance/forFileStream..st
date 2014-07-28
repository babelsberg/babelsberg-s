initialize-release
forFileStream: aFileStream

	self descriptor: (self handleForFile: aFileStream).
	self setDefaultEventMask.
