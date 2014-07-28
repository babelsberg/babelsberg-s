event handling
endManipulation
	"This method is called when a constrainable point is ending being manipulated, i.e., upon mouse up.  The constrainable point is stored in the 'dragPoint' instance variable, and the corresponding plan for moving that point is stored in the 'plan' instance variable.

	The order of messages is:
		1. #beginManipulation
		2-N. #manipulationMoveTo:
		N+1. #endManipulation"

	cs endEdit.
	self changed.