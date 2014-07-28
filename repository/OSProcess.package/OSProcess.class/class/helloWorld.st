examples
helloWorld
	"Write a message on the standard output stream of the OS process, normally
	the terminal or window from which Squeak is being run. Most operating
	systems implement stdin, stdout, and stderr in some manner, so this shown
	as an OSProcess example even though the implemention is in my subclasses."

	"OSProcess helloWorld"

	| this |
	this := self thisOSProcess.
	this stdOut ifNil: [self noAccessorAvailable. ^ nil].
	^ this stdOut nextPutAll: 'Hello world'; nextPut: Character lf; yourself