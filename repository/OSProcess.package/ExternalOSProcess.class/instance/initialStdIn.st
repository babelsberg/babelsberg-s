accessing
initialStdIn
	"The stdin stream at the time the child process is invoked. If the same as
	stdin for the current Squeak process, it may change as a result of Squeak
	using its stdin stream. The child process may also modify its actual stdin;
	therefore this is not an accurate representation of the child process stdin
	during the life of the child process."

	^ initialStdIn