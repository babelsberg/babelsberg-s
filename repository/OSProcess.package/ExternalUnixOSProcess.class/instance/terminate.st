terminating child
terminate
	"Kill the child process which I represent."

	self sigkill.
	self finalize

