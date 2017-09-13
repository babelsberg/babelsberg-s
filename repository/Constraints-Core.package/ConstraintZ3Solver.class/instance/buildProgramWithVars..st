solving
buildProgramWithVars: aCollection
"This method returns the string that is the Z3 program (SMT2 format)."
	| program |
	program := self options.
	aCollection do: [:v | program := program, v printDeclaration, Character cr].
	self constraints do: [:c | program := program, c print, Character cr].
	program := program, 
				'(check-sat)', Character cr,
				'(get-value ('.
	aCollection do: [:v | program := program, v varName, ' '].
	program := program, '))'.
	^ program