comparing
= another

	^ self class = another class
		and: [self a = another a
				and: [self b = another b]]