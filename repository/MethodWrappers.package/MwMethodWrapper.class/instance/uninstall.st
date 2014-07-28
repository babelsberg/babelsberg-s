installation
uninstall

	self flag: #rhi. "The #uninstall should actually become #destroy!"
	[	self clientMethod ifNil: [^ self].
		(self wrappedClass compiledMethodAt: self clientSelector ifAbsent: [nil]) == self
			ifTrue: [self wrappedClass == self definingClass
				ifTrue: [self wrappedClass
					addSelectorSilently: self clientSelector
					withMethod: self clientMethod]
				ifFalse: [self wrappedClass removeSelectorSilently: self clientSelector]].
		self clientMethod isMwMethodWrapper
			ifTrue: [self clientMethod wrappingWrapper: self wrappingWrapper].
		self wrappingWrapper
			ifNotNil: [
				self wrappingWrapper
					clientMethod: self clientMethod;
					definingClass: self definingClass.
				self wrappingWrapper: nil].
		self
			definingClass: nil;
			clientMethod: nil.
	] ensure: [
		self flag: #rhi. "KLUDGE: Einwegwrapper."
		self wasActive: true].