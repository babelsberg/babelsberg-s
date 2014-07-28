instance creation
exec: programName
	"Run a program in an external OS process, and answer an instance of myself
	which represents the external process."

	"ExternalOSProcess exec: '/bin/ls'"

	^ self concreteClass exec: programName
