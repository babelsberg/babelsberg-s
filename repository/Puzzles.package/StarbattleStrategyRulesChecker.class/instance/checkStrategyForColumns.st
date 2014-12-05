solving
checkStrategyForColumns
"This method checks, whether a column has already two stars. Then, it removes the stars (repesented by a 1) in all other cells."
	1 to: self inputMatrix columnCount do:
		[:column | self checkStrategyFor: (self inputMatrix atColumn: column)].