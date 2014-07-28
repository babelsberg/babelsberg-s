manipulating
solve
	"optimize and set external variables (useful if autoSolve has been set to false)"
	self optimize: self objective.
	self setExternalVariables
