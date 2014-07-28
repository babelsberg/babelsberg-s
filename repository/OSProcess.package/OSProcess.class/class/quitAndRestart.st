utility
quitAndRestart
	"Save image, start a new instance from the saved image, and quit this instance.
	This is useful if the VM has been recompiled or if a new pluggable primitive
	has been added."

	"OSProcess quitAndRestart"

	| firstPid this |
	firstPid := OSProcess thisOSProcess pid.
	firstPid ifNil: 
			[self noAccessorAvailable.
			^ nil].
	Smalltalk saveSession.
	"Value of firstPid gets saved in the image"
	this := OSProcess thisOSProcess.
	this pid = firstPid ifTrue: [self squeak ifNotNil: [Smalltalk quitPrimitive]].
	^ this