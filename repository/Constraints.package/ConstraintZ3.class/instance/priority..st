accessing
priority: anObject 
"Ths method should retract all external constraints and re-enable them using the new priority."
	anObject = ConstraintPriority required
		ifFalse: [self error: 'The priority of a Z3 constraint must be required. Soft constraints are not supported yet.'].