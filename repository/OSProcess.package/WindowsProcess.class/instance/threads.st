accessing
threads
	"One or more threads of execution within the OS process. The main
	thread for the process is held by the mainThread variable and is not
	included in this collection. Threads are created to wait for the exit of
	child processes, so this collection grows as child processes are created."

	^ threads ifNil: [threads := OrderedCollection new]
