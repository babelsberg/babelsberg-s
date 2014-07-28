running
testDefiningWrappedDifferent

	| wrapper clientSelector wrappedClass |
	clientSelector := #methodOne.
	wrappedClass := MwClassB.
	wrapper := self wrapperClass on: clientSelector inClass: wrappedClass.
	wrapper install.
	self assert: wrapper definingClass == MwClassA.
	self assert: wrapper wrappedClass == wrappedClass.
	wrapper uninstall.