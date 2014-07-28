testing
testSimpleAssignmentConstraint

	| ex |
	ex := ExampleClass new.
	self shouldnt: [[ex a = 42] alwaysTrue.] raise: Error.
	self should: [ex a isNumber].
	self should: [ex a = 42].