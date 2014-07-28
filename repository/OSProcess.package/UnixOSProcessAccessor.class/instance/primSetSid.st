external process access
primSetSid
	"Quoted from Linux man pages:
	setsid() creates a new session if the calling process is not a process group leader.
	The calling process is the leader of the new session, the process  group  leader  of
	the new process group, and has no controlling tty.  The process group ID and session
	ID of the calling process are set to the PID of the calling  process.   The  calling
	process  will be the only process in this new process group and in this new session."

	<primitive: 'primitiveSetSid' module: 'UnixOSProcessPlugin'>
	^ nil