child process management
updateActiveChildren
	"Test each active child for its completion status and update runState and exitStatus
	accordingly. This method may be called when a semaphore is set indicating that
	some child OSProcess has died. A better approach might be to use an event queue
	for death of child events; however, until event queues are part of Squeak image,
	this polling mechanism is sufficient."

	self activeChildren do:
		[:child | child update: #runState]
