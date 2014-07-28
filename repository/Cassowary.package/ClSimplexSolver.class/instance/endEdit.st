manipulating
endEdit
	"Do any needed cleanup after editing.  (See ClSimplexSolver beginEdit for sequence of calls)."

	self editConstraints do: [:cn | self removeConstraint: cn].
	self editVars: #().
	self editConstraints: #()