display management
openXDisplay
	"Restore headful display opening the X session."

	"self thisOSProcess closeXDisplay. (Delay forSeconds: 5) wait. self thisOSProcess openXDisplay."

	| proc |
	proc := self processAccessor primOpenXDisplay.
	proc ifNil: [self noAccessorAvailable].
	^ proc
