as yet unclassified
testInstallClosestToMethod
	| current wrapperOne wrapperTwo aClass aSelector |
	aClass := MwClassA.
	aSelector := #methodOne.
	current := aClass compiledMethodAt: aSelector.
	
	wrapperOne := self wrapperClass on: aSelector inClass: aClass.
	wrapperTwo := self wrapperClass on: aSelector inClass: aClass.
	
	wrapperOne install.
	wrapperTwo installClosestToMethod.
	
	self deny: [ wrapperTwo clientMethod isMwMethodWrapper ].
	
	current isMwMethodWrapper
		ifTrue: [ 
			self assert: [ current clientMethod == wrapperTwo ].
			self assert: [ wrapperOne clientMethod == current ] ]
		ifFalse: [
			self assert: [ wrapperTwo clientMethod == current ].
			self assert: [ wrapperOne clientMethod == wrapperTwo ] ].
	
	wrapperTwo uninstall.
	wrapperOne uninstall.