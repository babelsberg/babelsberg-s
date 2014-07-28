drawing
drawForegroundOn: aCanvas

	lines do: [:each |
		aCanvas 
			line: each first valuePoint + self position
			to: each second valuePoint + self position
			color: Color white].
	nodes do: [:each |
		aCanvas
			fillRectangle: ((-5@-5 corner: 5@5) translateBy: each valuePoint + self position)
			color: Color yellow].