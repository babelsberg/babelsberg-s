examples
testPipeLine
	"Create two OS pipes, and a child OS process with its input connected to 
	one pipe and its  output connected to the other pipe. Write some text to
	the input pipe, and read the resulting output (just echoed back by the
	Unix cat command) back through the output pipe. Send a SIGHUP signal
	to the child process to tell it to exit.

	This test verifies the ability of Squeak to send text to an external OS process
	through a pipe, and read the output text back from another pipe.
	See ConnectedUnixProcess for a more useful implementation."

	"UnixProcess testPipeLine inspect"

	| testString pipe1 pipe2 input output src dest desc result child |
	OSProcess accessor canAccessSystem ifFalse: [^ nil].
	testString := 'This is the text to write out through one pipe, copy through an external cat command, and then read back in through another pipe.'.
	pipe1 := OSPipe blockingPipe.
	pipe2 := OSPipe nonBlockingPipe.
	input := pipe1 reader.
	output := pipe2 writer.
	src := pipe1 writer.
	dest := pipe2 reader.
	desc := Array
				with: input
				with: output
				with: nil.
	child := self
				forkJob: '/bin/cat'
				arguments: nil
				environment: nil
				descriptors: desc.
	input close.
	output close.
	src nextPutAll: testString.
	src close.
	(Delay forSeconds: 1) wait.
	result := dest next: testString size.
	dest close.
	child sigterm. "Tell the child to exit"
	^ result
