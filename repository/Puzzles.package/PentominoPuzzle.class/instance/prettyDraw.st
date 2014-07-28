printing
prettyDraw

	| result colors |
	result := Form extent: (self columnCount @ self rowCount) depth: 32.
	colors := Color wheel: (self rowCount * self columnCount / 5) saturation: 0.8 brightness: 0.9.
	(1 to: self rowCount) do: [:row | 
		(1 to: self columnCount) do: [:column | | pts index |
			pts := (self allPoints select: [:point | point x = row & (point y = column)]).
			pts isEmpty 
				ifTrue: [result colorAt: (column-1)@(row-1) put: Color white]
				ifFalse: [index := (self allPoints indexOf: pts first).
					result colorAt: (column-1)@(row-1) put: (colors at: (index-1) // 5 + 1)]]].
	^ (result magnifyBy: 100) asMorph
			setProperty: #puzzle toValue: self;
			yourself