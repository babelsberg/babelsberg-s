initialize - release
finalize
	"Clean up grimReaper and associated semaphore."

	self grimReaper ifNotNil:
			[grimReaper terminate.
			grimReaper := nil].
	self sigChldSemaphore ifNotNil:
			[self restoreSigChld.
			self sigChldSemaphore: nil]
