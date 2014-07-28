testing
testConstraintObjectInterface

	| ex constraint |
	ex := ExampleClass new.

	constraint := [ex a = 2] alwaysTrue.
	self should: [constraint isConstraint].

	self shouldnt: [constraint enable] raise: Error.	"Should print a Warning, because it is already enabled."
	self should: [ex a: 3] raise: ConstraintUnsatisfiableError.

	self shouldnt: [constraint disable] raise: Error.
	self shouldnt: [ex a: 4] raise: Error.