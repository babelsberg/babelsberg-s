running
testCodeString1

	| expected actual |
	expected := 'value: t1
	| t |
	(t := #Array new: 1) at: 1 put: t1.
	^ #''The method wrapper should be inserted in this position!'' valueWithReceiver: self arguments: t'.
	actual := self wrapperClass codeStringFor: 1.
	self assert: expected = actual.