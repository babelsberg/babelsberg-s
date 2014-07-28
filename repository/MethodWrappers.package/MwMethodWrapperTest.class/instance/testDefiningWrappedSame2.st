running
testDefiningWrappedSame2

	| wrapper clientSelector wrappedClass |
	clientSelector := #methodTwo.
	wrappedClass := MwClassA.
	wrapper := self wrapperClass on: clientSelector inClass: wrappedClass.
	wrapper install.
	self assert: wrapper definingClass == wrappedClass.
	self assert: wrapper wrappedClass == wrappedClass.
	wrapper uninstall.