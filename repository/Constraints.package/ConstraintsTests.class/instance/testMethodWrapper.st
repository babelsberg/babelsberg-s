testing
testMethodWrapper

	| ex ex2 ex3 |
	ex := ExampleClass new.
	ex a: 23.
	ex b: 24.
	ex2 := ExampleClass new.
	ex2 a: 17.
	ex2 b: 18.
	ex3 := ExampleClass new.
	ex3 a: 41.
	ex3 b: 42.

	self shouldnt: [[(ex a - ex2 b) + ex3 a = (ex2 a - (ex b + ex3 b))] alwaysTrue] raise: Error.
	self should: [(ex a - ex2 b) + ex3 a = (ex2 a - (ex b + ex3 b))].

	self should: [(ex class methodDict at: #a) class == ConstraintMethodWrapperForGetter].
	self should: [(ex class methodDict at: #b) class == ConstraintMethodWrapperForGetter].

	self should: [(ex class methodDict at: #a:) class == ConstraintMethodWrapperForSetter].
	self should: [(ex class methodDict at: #b:) class == ConstraintMethodWrapperForSetter].