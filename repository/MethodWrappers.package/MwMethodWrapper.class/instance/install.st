installation
install

	| holdingClass method |
	self flag: #rhi. "KLUDGE: Einwegwrapper."
	self wasActive ifTrue: [self error: 'Einwegwrapper!'].
	holdingClass := self wrappedClass whichClassIncludesSelector: self clientSelector.
	holdingClass isNil ifTrue: [^ self].
	method := holdingClass compiledMethodAt: self clientSelector.
	method == self ifTrue: [^ self].
	self clientMethod: method.
	method isMwMethodWrapper
		ifTrue: [
			method wrappingWrapper: self.
			self definingClass: method definingClass]
		ifFalse: [self definingClass: holdingClass].
	self wrappedClass addSelectorSilently: self clientSelector withMethod: self.