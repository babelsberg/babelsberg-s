solving
setConstraintVariableValues: aCollection From: aDict
"This method should set the constraint variable values."

	aCollection do: [:var | var varValue: (aDict at: var varName)].