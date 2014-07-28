drawing
drawForegroundOn: aCanvas
	| colors index |

	colors := Color wheel: 5.
	index := 1.

	self constraintPointsDo: [:each | | col |
		col := (colors at: index) lighter lighter.
		index := index + 1.
		aCanvas 
			fillRectangle: ((-20@-20 corner: 20@20) translateBy: each valuePoint + self position)
			color: col]
