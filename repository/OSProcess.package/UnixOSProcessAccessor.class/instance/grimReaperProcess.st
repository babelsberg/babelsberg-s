initialize - release
grimReaperProcess
	"This is a process which waits for the death of a child OSProcess, and 
	informs any dependents of the change. Use SIGCHLD events if possible,
	otherwise a Delay to poll for exiting child processes."

	| event processSynchronizationDelay |
	^ self canAccessSystem
		ifTrue:
			[event := (self canAccessSystem and: [self canForwardExternalSignals])
				ifTrue: [self sigChldSemaphore]
				ifFalse: [Delay forMilliseconds: 200].
			processSynchronizationDelay := Delay forMilliseconds: 20.
			grimReaper ifNil:
				[grimReaper :=
					[[event wait.
					processSynchronizationDelay wait. "Avoids lost signals in heavy process switching"
					self changed: #childProcessStatus] repeat] newProcess.
					grimReaper resume.
					"name selected to look reasonable in the process browser"
					grimReaper name: ((ReadStream on: grimReaper hash asString) next: 5)
							, ': the child OSProcess watcher']]
		ifFalse:
			[nil]
