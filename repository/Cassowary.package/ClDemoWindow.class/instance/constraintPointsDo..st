enumerating
constraintPointsDo: aBlock
	"Evaluate this block for each of the constrainable points in this demo.  Constrainable points are those that can be manipulated by the mouse.  A constraint point is a Point object whose x and y instance variables hold instances of ClVariable.

	aBlock 	<Block<Point<ClVariable>>>"

	self subclassResponsibility