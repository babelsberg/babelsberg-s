initialize - release
initializeAllMyChildren
	"On Windows, the process ID is not unique. Use an OrderedCollection instead
	of a Dictionary to keep track of the child processes."

	^ allMyChildren := OrderedCollection new
