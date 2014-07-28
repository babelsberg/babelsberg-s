as yet unclassified
testConflictDetection
	| wrapperOne wrapperTwo aClass aSelector |
	aClass := MwClassA.
	aSelector := #methodOne.	

	wrapperOne := self wrapperClass on: aSelector inClass: aClass.
	wrapperTwo := self wrapperClass on: aSelector inClass: aClass.
	
	wrapperOne installClosestToMethod.
	self should: [ wrapperTwo installClosestToMethod ] raise: AssertionFailure.
	
	wrapperTwo uninstall.
	wrapperOne uninstall.