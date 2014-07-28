running
testProperties
	| wrapper |
	wrapper := self wrapperClass new..
	self assert: wrapper clientSelector == nil.
	self assert: wrapper clientMethod == nil.
	self assert: wrapper definingClass == nil.
	self assert: wrapper wrappedClass == nil.
	self assert: wrapper wrappingWrapper == nil