pipe open
primCreatePipe
	"Create a pipe, and answer an array of two file handles (SQFile data structures in interp.c)
	for the pipe reader and writer."

	<primitive: 'primitiveCreatePipe' module: 'Win32OSProcessPlugin'>
	^ nil