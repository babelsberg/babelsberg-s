testing
testConstraintObjectForConjunction

	| ex ex2 |
	ex := ExampleClass new.
	ex2 := ExampleClass new.

	self should: [[ex a = 2 & (ex b = 4)] alwaysTrue class == ConstraintCassowary].
	self should: [[(ex a = 2 & (ex2 b = 4)) & (ex2 a = 8)] alwaysTrue class == ConstraintCassowary].
	self should: [[(ex2 a = 8) & (ex a = 2 & (ex2 b = 4))] alwaysTrue class == ConstraintCassowary].