testing
testComplexInequalityConstraints

	| ex ex2 constraint |
	ex := ExampleClass new.
	ex a: 15.
	ex b: 15.
	ex2 := ExampleClass new.
	ex2 a: 5.
	ex2 b: 5.

	self shouldnt: [[ex a <= 10] alwaysTrue] raise: Error.
	self shouldnt: [[ex b >= 20] alwaysTrue] raise: Error.
	self should: [[ex a = ex b] alwaysTrue] raise: ConstraintUnsatisfiableError.

	self shouldnt: [[ex a <= ex2 a] alwaysTrue] raise: Error.
	self shouldnt: [constraint := [ex2 a >= 20] alwaysTrue] raise: Error.
	constraint disable.
	self shouldnt: [constraint := [ex2 a <= 5] alwaysTrue] raise: Error.
	constraint disable.

	self shouldnt: [[ex b <= ex2 a] alwaysTrue] raise: Error.
	self should: [[ex2 a <= 10] alwaysTrue] raise: ConstraintUnsatisfiableError.