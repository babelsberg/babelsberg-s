accessing
asConstantConstraintVariable

	^ ConstraintConstantVariable new
			originalValue: self originalValue;
			solver: self solver;
			externalVariable: self externalVariable