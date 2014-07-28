initialize-release
forFileStream: aFileStream exceptions: exceptionEventFlag readEvents: readEventFlag writeEvents: writeEventFlag

	self descriptor: (self handleForFile: aFileStream).
	self initializeForExceptions: exceptionEventFlag readEvents: readEventFlag writeEvents: writeEventFlag

