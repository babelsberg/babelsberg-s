printing
prettyPrint

	| result |
	result := '', Character cr.
	(1 to: self rowCount) do: [:row | 
		(1 to: self columnCount) do: [:column | | pts index |
			pts := (self allPoints select: [:point | point x = row & (point y = column)]).
			pts isEmpty 
				ifTrue: [result := result, ' ']
				ifFalse: [index := (self allPoints indexOf: pts first).
					result := result, (self pentominoNames at: (index-1) // 5 + 1)]]. 
		result := result, Character cr].
	^ result