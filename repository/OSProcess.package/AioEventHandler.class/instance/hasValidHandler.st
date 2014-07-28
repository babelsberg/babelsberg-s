handler process
hasValidHandler
	"True if the event handler is running, and if it refers to the correct external
	object semaphore. For protection following an image restart."

	^ semaIndex notNil
		and: [Smalltalk externalObjects size >= semaIndex
			and: [(Smalltalk externalObjects at: semaIndex) == semaphore]]