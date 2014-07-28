initialize-release
initialize

	"ThisOSProcess initialize"

	OSProcess initialize. "required to ensure the change sets file in smoothly"
	AttachableFileStream initialize.
	OSProcessAccessor initialize.
	self initializeThisOSProcess.
	Smalltalk addToStartUpList: ThisOSProcess.
	Smalltalk addToShutDownList: ThisOSProcess
