installation
installBeforeClientMethod: aMethodWrapper
	aMethodWrapper 
		clientMethod: self clientMethod;
		setSourcePointer: self sourcePointer;
		definingClass: self definingClass;
		wrappingWrapper: self.
			
	self clientMethod: aMethodWrapper