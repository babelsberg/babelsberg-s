child process creation
forkHeadlessSqueak
	"Just like forkSqueak, except that the child Squeak continues headless."

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
				[connected ifTrue: [self disconnectXDisplay].
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
