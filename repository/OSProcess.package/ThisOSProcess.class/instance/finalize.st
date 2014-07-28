finalization
finalize

	processAccessor
		ifNotNil: 
			[processAccessor removeDependent: self.
			processAccessor finalize].
	processAccessor := nil