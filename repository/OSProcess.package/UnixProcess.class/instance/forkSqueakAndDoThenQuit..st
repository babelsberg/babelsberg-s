child process creation
forkSqueakAndDoThenQuit: aBlock
	"Start a new instance of Squeak running in a child OS process. The new instance is a
	clone of this image except for the return value of this method. It does not reload the
	image file from disk. The child image evaluates aBlock.

	The child should not depend on using existing connections to external resources. For
	example, the child may lose its connections to stdin, stdout, and stderr after its parent
	exits."

	"UnixProcess thisOSProcess forkSqueakAndDoThenQuit:
		[Object inform: 'Hi, I am the child Squeak process.']"

	| childOrThisProc |
	childOrThisProc := self forkSqueak.
	(childOrThisProc == self)
		ifTrue:
			[ aBlock value.
			Smalltalk quitPrimitive]. "Child process"
	^ childOrThisProc