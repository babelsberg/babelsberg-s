initialize-release
eventGeneratorProcess
	"A process that generates periodic #changed events"

	| d p|
	d := Delay forMilliseconds: 125.
	p := [[self changed.
	d wait] repeat] newProcess.
	^p resume.