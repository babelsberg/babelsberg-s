display management
closeXDisplay
	"Become headless by closing the X session. All subsequent processing should involve
	no further display interaction."

	"self thisOSProcess closeXDisplay"

	| proc |
	proc := self processAccessor primKillDisplay.
	proc ifNil: [self noAccessorAvailable].
	^ proc
