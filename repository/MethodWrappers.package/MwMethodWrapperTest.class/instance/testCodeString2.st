running
testCodeString2

	| expected actual |
	expected := 'value: t1 value: t2
	| t |
	(t := #Array new: 2) at: 1 put: t1; at: 2 put: t2.
	^ #''The method wrapper should be inserted in this position!'' valueWithReceiver: self arguments: t'.
	actual := self wrapperClass codeStringFor: 2.
	self assert: expected = actual.