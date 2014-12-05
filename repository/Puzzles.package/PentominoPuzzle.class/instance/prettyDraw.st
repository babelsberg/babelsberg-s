printing
prettyDraw

	| result colors |
	result := Form extent: (self columnCount @ self rowCount) depth: 32.
	"colors := Color wheel: (self rowCount * self columnCount / 5) saturation: 0.8 brightness: 0.9."
	colors := {Color r: 255 g: 255 b: 51 range: 255.
			Color r: 55 g: 126 b: 184 range: 255. 
			Color r: 77 g: 175 b: 74 range: 255. 
			Color r: 228 g: 26 b: 28 range: 255. 
			Color r: 255 g: 127 b: 0 range: 255. 
			Color r: 152 g: 78 b: 163 range: 255}.
	(1 to: self rowCount) do: [:row | 
		(1 to: self columnCount) do: [:column | | pts index |
			pts := (self allPoints select: [:point | point x = row & (point y = column)]).
			pts isEmpty 
				ifTrue: [result colorAt: (column-1)@(row-1) put: Color white]
				ifFalse: [index := (self allPoints indexOf: pts first).
					result colorAt: (column-1)@(row-1) put: (colors at: (index-1) // 5 + 1)]]].
	^ (result magnifyBy: 100) asMorph
			borderWidth: 7;
			borderColor: Color black;
			setProperty: #puzzle toValue: self;
			yourself