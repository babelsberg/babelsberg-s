display management
disconnectXDisplay
	"Disconnect from the X server, but do not close the existing Squeak window. A new
	display medium must be opened before further interaction with the display."

	"self thisOSProcess disconnectXDisplay"

	| proc |
	proc := self processAccessor primDisconnectDisplay.
	proc ifNil: [self noAccessorAvailable].
	^ proc
