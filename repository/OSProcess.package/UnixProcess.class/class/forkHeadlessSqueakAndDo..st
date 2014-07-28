child process creation
forkHeadlessSqueakAndDo: aBlock 
	"Start a new instance of Squeak running in a child OS process, and  
	execute aBlock in the child instance. The new instance is a clone of 
	this image, but without a connection to the X display. The child instance 
	executes aBlock, which hopefully does not involve interaction with the 
	X display; and the parent continues normally.  
	  
	The child should not depend on using existing connections to external  
	resources. For example, the child may lose its connections to stdin, 
	stdout, and stderr after its parent exits."

	"UnixProcess forkHeadlessSqueakAndDo: [UnixProcess helloWorld]"

	^ self thisOSProcess forkHeadlessSqueakAndDo: aBlock

