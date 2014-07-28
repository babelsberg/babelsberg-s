examples
helloStdErr
	"Write a message on the standard error stream of the OS process, normally
	the terminal or window from which Squeak is being run. Most operating
	systems implement stdin, stdout, and stderr in some manner, so this shown
	as an OSProcess example even though the implemention is in my subclasses."

	"OSProcess helloStdErr"

	| this |
	this := self thisOSProcess.
	this stdErr ifNil: [self noAccessorAvailable. ^ nil].
	^ this stdErr nextPutAll: 'Hello stderr'; nextPut: (Character lf); yourself