running
testOnInClass

	| wrapper clientSelector wrappedClass |
	clientSelector := #methodOne.
	wrappedClass := MwClassA.
	wrapper := self wrapperClass on: clientSelector inClass: wrappedClass.
	self assert: wrapper clientSelector == clientSelector.
	self assert: wrapper clientMethod == nil.
	self assert: wrapper definingClass == nil.
	self assert: wrapper wrappedClass == wrappedClass.
	self assert: wrapper wrappingWrapper == nil.
	wrapper uninstall.