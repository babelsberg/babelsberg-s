IO redirection
redirectStdOutTo: fileStream
	"Redirect the standard output stream to another output stream."

	"| pipe |
	pipe := OSPipe nonBlockingPipe.
	OSProcess thisOSProcess redirectStdOutTo: pipe writer.
	pipe"
	
	^ self redirect: self stdOut to: fileStream
