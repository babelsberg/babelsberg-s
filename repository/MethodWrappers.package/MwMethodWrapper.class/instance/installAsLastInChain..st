installation
installAsLastInChain: aMethodWrapper

	self clientMethod isMwMethodWrapper
		ifTrue: [ self clientMethod installAsLastInChain: aMethodWrapper]
		ifFalse: [ 
			self assert: [self wasInstalledClosestToMethod not] 
				description: 'there is already a wrapper installed closest to the method'.
			
			self installBeforeClientMethod: aMethodWrapper.
			aMethodWrapper markAsInstalledClosestToMethod ].