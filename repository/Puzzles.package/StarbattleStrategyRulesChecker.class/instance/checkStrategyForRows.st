solving
checkStrategyForRows
"This method checks, whether a row has only two possible stars. Then, it sets the stars and removes the stars (repesented by a 1) in all other cells."
	1 to: self inputMatrix rowCount do:
		[:row | self checkStrategyFor: (self inputMatrix atRow: row)].