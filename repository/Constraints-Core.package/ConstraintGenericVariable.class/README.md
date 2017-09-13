A ConstraintGenericVariable represents all values that are used inside a constraint but does not have a concrete ConstraintVariable.

Instance Variables
	constraint:		The constraint is needed to invalidate and recreate the constraint, if this generic variable changes its value.
	originalValue:	The original object
