evaluating
valueWithReceiver: anObject arguments: anArrayOfObjects

	self flag: #rhi. "Need to ensure RecursionLock semantics!"
	^ self recursionLock critical: [
		self clientMethod valueWithReceiver: anObject arguments: anArrayOfObjects]