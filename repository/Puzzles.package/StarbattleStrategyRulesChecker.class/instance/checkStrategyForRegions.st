solving
checkStrategyForRegions
"This method checks, whether a column has already two stars. Then, it removes the stars (repesented by a 1) in all other cells."
	self inputMatrix regions do:
		[:region | self checkStrategyFor: region].