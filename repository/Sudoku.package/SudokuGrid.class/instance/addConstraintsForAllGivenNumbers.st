solving
addConstraintsForAllGivenNumbers
	"This method creates equality constraints for all given numbers (e.g. '(self at: 1 at: 5) = 3'), so that the given numbers cannot be changed by the solver. Additionally, these constraints have to be stored, so deleting a number will disable the corresponding constraint."
	self withIndicesDo: [:val :row :column | 
		val ~= 0 ifTrue: [equalityConstraints at: row at: column put: 
							([(self at: row at: column) = val] alwaysSolveWith: solver)]].