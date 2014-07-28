solving
disableEqualityConstraintAt: x at: y
	"This method is called, if a number is deleted. It disables the corresponding equality constraint and removes it."
	(equalityConstraints at: x at: y) ifNil: [Transcript show: 
		'WARNING - Cannot disable the equality constraint at (', x, ',', y, '), because there is no constraint to disable.'; cr.
		^ self].
	(equalityConstraints at: x at: y) disable.
	equalityConstraints at: x at: y put: nil.