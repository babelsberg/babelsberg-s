installation
installOnObject: anObject

	| oldClass newBehavior lock |
	oldClass := anObject class.
	newBehavior := Behavior new.
	newBehavior instVarNamed: 'format' put: oldClass format.
	newBehavior superclass: oldClass.
	newBehavior methodDictionary: MethodDictionary new.
	self flag: #rhi. "Call self>>#installOn: instead! (#allSelectors vs. #selectors?!)"
	lock := Semaphore new.
	newBehavior allSelectors asOrderedCollection collect: [:each |
		(self on: each inClass: newBehavior)
			recursionLock: lock;
			install;
			yourself].
	newBehavior
		addSelector: #synchronize
		withMethod: (self class compiledMethodAt: #synchronize).
	newBehavior
		addSelector: #unsynchronize
		withMethod: (self class compiledMethodAt: #unsynchronize).
	anObject primitiveChangeClassTo: newBehavior basicNew.