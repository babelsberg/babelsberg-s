testing
testConstraintBlockWithoutVariables

	self shouldnt: [[1 = 1] alwaysTrue] raise: Error.
	self should: [[1 = 2] alwaysTrue] raise: Error.