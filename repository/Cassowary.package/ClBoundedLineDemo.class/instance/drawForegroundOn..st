drawing
drawForegroundOn: aCanvas

	aCanvas 
		line: p1 valuePoint + self position 
		to: p2 valuePoint + self position
		width: 2
		color: Color white
