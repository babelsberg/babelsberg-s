manipulating
autoSolve
	"the 'autoSolve' instance variable determines whether the solver should 
		automatically optimize and set external variable values after each 
		call to 'addConstraint' and 'removeConstraint'.  By default, auto-solving is on.  However,
		when auto-solving is off,  'resolve' must be invoked to see changes to the
		constrained variables"
	^autoSolve