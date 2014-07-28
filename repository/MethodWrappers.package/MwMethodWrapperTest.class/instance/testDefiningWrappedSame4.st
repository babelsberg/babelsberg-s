running
testDefiningWrappedSame4

	| wrapper clientSelector wrappedClass |
	clientSelector := #methodThree.
	wrappedClass := MwClassB.
	wrapper := self wrapperClass on: clientSelector inClass: wrappedClass.
	wrapper install.
	self assert: wrapper definingClass == wrappedClass.
	self assert: wrapper wrappedClass == wrappedClass.
	wrapper uninstall.