initialization
initialize
	"Initialize the demo structures before the widgets are created."

	super initialize.
	self extent: self initialExtent.
	cs := ClSimplexSolver new.
	errorPixel := nil