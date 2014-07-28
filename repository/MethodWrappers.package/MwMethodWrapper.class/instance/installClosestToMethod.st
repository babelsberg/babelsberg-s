installation
installClosestToMethod
	| holdingClass clientMethod |
	self wasActive ifTrue: [self error: 'Einwegwrapper!'].
	holdingClass := self wrappedClass whichClassIncludesSelector: self clientSelector.
	holdingClass isNil ifTrue: [^ self].
	clientMethod := holdingClass compiledMethodAt: self clientSelector.
	clientMethod == self ifTrue: [^ self].
	
	clientMethod isMwMethodWrapper
		ifTrue: [
			clientMethod installAsLastInChain: self ]
		ifFalse: [
			self 
				definingClass: holdingClass;
				clientMethod: clientMethod;
				setSourcePointer: clientMethod sourcePointer.
		
			self wrappedClass addSelectorSilently: self clientSelector withMethod: self.
			self markAsInstalledClosestToMethod ].