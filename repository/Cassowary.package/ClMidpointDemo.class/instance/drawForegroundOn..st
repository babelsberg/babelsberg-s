drawing
drawForegroundOn: aCanvas

	aCanvas 
		line: p1 valuePoint + self position
		to: p2 valuePoint + self position
		width: 2
		color: Color white.

	aCanvas 
		line: m1 valuePoint + self position - (0@1)
		to: m1 valuePoint + self position + (0@1)
		width: 2
		color: Color red.