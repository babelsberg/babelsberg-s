initialize-release
forSocket: aSocket
	"Any existing event handling for aSocket will be disabled. Note that this
	will make the socket useless for any applications that expect the prior
	event handling behavior."

	self descriptor: (self handleForSocket: aSocket).
	self aioDisable: self descriptor.
	self setDefaultEventMask.
