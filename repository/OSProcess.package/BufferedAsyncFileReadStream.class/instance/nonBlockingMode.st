accessing
nonBlockingMode
	"True if nonblocking read behavior should be implemented"

	^ nonBlockingMode ifNil: [nonBlockingMode := true]
