examples
clientServerDemo
	"Start a new headless instance of Squeak running in a child OS process. The new
	instance is a nearly identical copy of its parent, resuming execution at the same
	point as the parent. The child process will run a TCP server process in the headless
	image, then exit. Test results are written to the Transcript.

	Answer '127 0 0 1' in response to the host address dialog."

	"UnixProcess clientServerDemo"

	| proc |
	proc := self forkHeadlessSqueakAndDoThenQuit: [Socket remoteTestServerTCP].
	proc ifNotNil: [Socket remoteTestClientTCP].
	^ proc

