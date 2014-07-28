accessing
initialStdOut
	"The stdout stream at the time the child process is invoked. If the same as
	stdout for the current Squeak process, it may change as a result of Squeak
	using its stdout stream. The child process may also modify its actual stdout;
	therefore this is not an accurate representation of the child process stdout
	during the life of the child process."

	^ initialStdOut