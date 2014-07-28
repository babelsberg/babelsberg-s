system startup
shutDown: quitting
	"Break dependency on my OSProcessAccessor. This is done explicitly at
	shutDown time in order to prevent possible problems when an image is
	restarted on another platform type, in which case a new ThisOSProcess
	instance is created and the old instance could still have an unwanted
	dependency on an OSProcessAccessor."

	quitting ifTrue: [OSProcess accessor
				ifNotNilDo: [:acc | acc breakDependents]]