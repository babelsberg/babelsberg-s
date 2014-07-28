testing - fork and exec
testPrimForkAndExec
	"These methods can only be tested properly from UnixProcess, which knows how
	to set up the parameters on the stack."

	"(UnixProcessAccessorTestCase selector: #testPrimForkAndExec) run"

	| p |
	self shouldnt: [p := UnixProcess command: 'ls /bin']
		raise: Warning.
	(Delay forMilliseconds: 500) wait.
	self should: [p isComplete].
	self should: [p exitStatus == 0]

