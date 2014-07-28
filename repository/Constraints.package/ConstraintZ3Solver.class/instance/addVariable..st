accessing
addVariable: aConstraintVariable

	| varNames varsWithSameName |
	varsWithSameName := self variables select: [:var | var varName beginsWith: aConstraintVariable varName].
	varNames := varsWithSameName collect: [:var | var varName splitInteger last].
	varNames sort.
	varNames ifNotEmpty: [aConstraintVariable varName: 
		aConstraintVariable varName, (varNames last + 1) asString].	
	self variableType ifNotNil: [aConstraintVariable type: self variableType].
	self variables add: aConstraintVariable.