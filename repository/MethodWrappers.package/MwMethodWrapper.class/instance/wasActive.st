testing
wasActive

	self flag: #rhi. "KLUDGE: Einwegwrapper."
	^ wasActive ifNil: [ wasActive := false ]