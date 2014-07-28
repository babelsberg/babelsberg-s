evaluating
beforeMethod

	(self called or: [self installing])
		ifFalse: [self called: true].