initialize-release
initialize

	super initialize.
	self readOnly.
	OSProcess accessor setNonBlocking: self ioHandle.
	self enableEventHandling
