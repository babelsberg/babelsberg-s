accessing
ppid
	"Always refresh ppid from the processAccessor, because it is possible for a child
	to be reparented when the parent exits. The child does not know about this, so
	we refresh ppid on every access."

	^ ppid := processAccessor primGetPPid
