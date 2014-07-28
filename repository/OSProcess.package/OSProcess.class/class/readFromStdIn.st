examples
readFromStdIn
	"Type some text on the standard input terminal, followed by <return> or <enter>,
	then call this method. Any available input text in the stdin stream will be read.
	This method sets standard input for the Squeak OS process for non-blocking reads
	in order to prevent the Smalltalk image from blocking on the read. After the read,
	standard input is set back to its normal blocking I/O mode.

	Most operating systems implement stdin, stdout, and stderr in some manner, so this
	is shown as an OSProcess example even though the implemention is in my subclasses."

	"OSProcess readFromStdIn inspect"

	| input ioHandle resultString |
	input := self thisOSProcess stdIn.
	input ifNil: [self noAccessorAvailable. ^ nil].
	ioHandle := input ioHandle.
	self accessor setNonBlocking: ioHandle.
	resultString := self thisOSProcess stdIn next: 10000.
	self accessor setBlocking: ioHandle.
	^ resultString
