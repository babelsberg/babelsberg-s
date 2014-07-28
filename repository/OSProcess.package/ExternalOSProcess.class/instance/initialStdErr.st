accessing
initialStdErr
	"The stderr stream at the time the child process is invoked. If the same as
	stderr for the current Squeak process, it may change as a result of Squeak
	using its stderr stream. The child process may also modify its actual stderr;
	therefore this is not an accurate representation of the child process stderr
	during the life of the child process."

	^ initialStdErr