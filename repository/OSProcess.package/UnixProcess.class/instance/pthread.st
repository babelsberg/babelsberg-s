accessing
pthread
	"The identity of the pthread in which the interpreter executes.
	Always refresh pthread from the processAccessor, because it is possible for a child
	to be reparented when the parent exits. The child does not know about this, so
	we refresh pthread on every access."

	^ pthread := processAccessor getThreadID
