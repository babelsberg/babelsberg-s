open/close
close
	"Close this file."

	| h |
	(h := self ioHandle) ifNotNil:
		[UseIOHandle
			ifTrue:
				[h close.
				self ioHandle: nil]
			ifFalse:
				[self primCloseNoError: h.
				self unregister.
				fileID := nil]]
