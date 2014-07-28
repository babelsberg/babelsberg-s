child process management
grimReaperProcess
	"This is a process which waits for the death of a child OSProcess, and 
	informs any dependents of the change."

	grimReaper ifNil: [grimReaper := [
				[self sigChldSemaphoreSet wait.
				self changed: #childProcessStatus] repeat] newProcess.
				grimReaper resume.
				"name selected to look reasonable in the process browser"
				grimReaper name: ((ReadStream on: grimReaper hash asString) next: 5)
						, ': the child OSProcess watcher'].
	^ grimReaper