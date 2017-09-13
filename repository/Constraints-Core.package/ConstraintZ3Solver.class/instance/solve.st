solving
solve
"This method builds the Z3 program, executes the binary and parses the result."
	| program result variableValueDict constrainedVars |

	constrainedVars := OrderedCollection new.
	self constraints do: [:c | c expressions do: [:expr | expr variables do: [:v | 
		((constrainedVars collect: [:var | var varName]) includes: v varName)
			ifFalse: [constrainedVars add: v]]]].
	constrainedVars ifEmpty: [constrainedVars := self variables].

	program := self buildProgramWithVars: constrainedVars.
	result := self executeProgram: program.
	variableValueDict := self parseResult: result.
	self setConstraintVariableValues: constrainedVars From: variableValueDict.
	