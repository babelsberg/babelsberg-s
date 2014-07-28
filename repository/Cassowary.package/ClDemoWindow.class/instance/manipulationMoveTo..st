event handling
manipulationMoveTo: aPoint
	"This method is called when a constrainable point is manipulated using the mouse, i.e., during mouse motion.  aPoint is the location of the mouse and thus the new requested location of the constrainable point.  The constrainable point is stored in the 'dragPoint' instance variable, and the corresponding plan for moving that point is stored in the 'plan' instance variable.

	The order of messages is:
		1. #beginManipulation
		2-N. #manipulationMoveTo:
		N+1. #endManipulation"

	cs suggestValue: dragPoint x newValue: aPoint x asFloat.
	cs suggestValue: dragPoint y newValue: aPoint y asFloat.
	cs resolve.
	self changed