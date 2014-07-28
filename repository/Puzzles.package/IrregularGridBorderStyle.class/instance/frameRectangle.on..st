drawing
frameRectangle: aRectangle on: aCanvas
	"Borders are drawn with greater borderWidth."
	aCanvas frameAndFillRectangle: aRectangle
		fillColor: Color transparent
		borderWidth: 1
		topLeftColor: Color gray lighter
		bottomRightColor: Color gray.

	self borderTop 
		ifTrue: [aCanvas line: aRectangle topLeft + (2@2) to: aRectangle topRight + (-2@2) width: 4 color: Color black].
	self borderBottom
		ifTrue: [aCanvas line: aRectangle bottomLeft + (2@(-2)) to: aRectangle bottomRight + ((-2)@(-2)) width: 4 color: Color black].
	self borderLeft
		ifTrue: [aCanvas line: aRectangle topLeft + (2@2) to: aRectangle bottomLeft + (2@(-2)) width: 4 color: Color black].
	self borderRight
		ifTrue: [aCanvas line: aRectangle topRight + ((-2)@2) to: aRectangle bottomRight + ((-2)@(-2)) width: 4 color: Color black].