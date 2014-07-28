child process management
primTerminateThread: aThreadHandle
	"Kill the thread. No cleanup is performed, so use with caution for a thread which
	is (for example) manipulating a mutex. Answer true for success, else false."

	<primitive: 'primitiveTerminateThread' module: 'Win32OSProcessPlugin'>

	^ nil