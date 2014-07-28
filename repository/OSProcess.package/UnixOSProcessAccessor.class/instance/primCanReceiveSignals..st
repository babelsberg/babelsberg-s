OS signal sending
primCanReceiveSignals: anIntegerPid
	"Answer true if an external OS process can receive signals. In most
	cases, if the process identified by anIntegerPid cannot receive signals, it is
	because the process does not exist and anIntegerPid is a stale reference (possibly
	left over from a previous Squeak session). Answer nil if the primitive does
	not exist (possibly because the VM is using an older version of the plugin)."

	<primitive: 'primitiveCanReceiveSignals' module: 'UnixOSProcessPlugin'>
	^ nil

