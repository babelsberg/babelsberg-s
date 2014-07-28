testing
testPriorityOrder

	| p1 p2 p3 p4 |
	p1 := ConstraintPriority required.
	p2 := ConstraintPriority strong.
	p3 := ConstraintPriority medium.
	p4 := ConstraintPriority weak.

	self should: [p1 <= p2].
	self should: [p2 <= p3].
	self should: [p3 <= p4].

	self should: [p1 < p2].
	self should: [p2 < p3].
	self should: [p3 < p4].

	self shouldnt: [p1 < p1].