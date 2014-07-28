child process creation
forkSqueak
	"Fork a child and continue running this Squeak image in both the parent and the child.
	Parent and child are distinguished by the pid returned by primForkSqueak.

	If continuing as the parent process, answer the ExternalUnixOSProcess which
	represents the child. This can be inspected to watch the run state of the child
	process from the parent.

	If continuing as the child process, answer OSProcess thisOSProcess. This can be
	inspected to watch the full state of the child process from the child. The
	child cannot directly view the state of its parent.

	Parent and child should be cautious about using shared connections to external
	resources."

	"self thisOSProcess forkSqueak"

	| thisPid childPid child connected |
	stdOut ifNil: [^ nil].
	self stdOut flush.
	self stdErr flush.
	thisPid := self pid.
	connected := self processAccessor canControlXDisplay
					and: [self flushXDisplay notNil].
	childPid := self processAccessor forkSqueak.
	^ childPid ifNotNil: [
		childPid == 0
			ifTrue:
				[connected ifTrue: [self disconnectXDisplay; recapitate].
				OSProcess thisOSProcess processAccessor changed: #pid.
				^ self]
			ifFalse:
				[child := ExternalUnixOSProcess new.
				child pid: childPid.
				child ppid: thisPid.
				child programName: self programName.
				child initialStdIn: self stdIn.	
				child initialStdOut: self stdOut.
				child initialStdErr: self stdErr.
				child arguments: self arguments.
				child initialEnvironment: self environment.
				child notYetRunning.
				self registerChildProcess: child.
				child running.
				^ child]]
