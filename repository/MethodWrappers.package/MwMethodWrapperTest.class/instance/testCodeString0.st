running
testCodeString0

	| expected actual |
	expected := 'value
	| t |
	t := #Array new.
	^ #''The method wrapper should be inserted in this position!'' valueWithReceiver: self arguments: t'.
	actual := self wrapperClass codeStringFor: 0.
	self assert: expected = actual.