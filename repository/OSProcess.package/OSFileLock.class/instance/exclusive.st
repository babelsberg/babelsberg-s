accessing
exclusive
	"Answer the value of exclusive. Default is true, indicating a read-write lock
	as opposed to a shared read lock."

	^ exclusive ifNil: [exclusive := true].