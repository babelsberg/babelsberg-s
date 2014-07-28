derived accessing
unwrappedMethod

	^ self clientMethod ifNotNil: [self clientMethod unwrappedMethod]