accessing
threads
	"One or more threads of execution within the OS process"

	^ threads ifNil: [threads := OrderedCollection new]
