event handling
beginManipulation
	"This method is called when a constrainable point is starting to be manipulated, i.e., upon mouse down.  The constrainable point is stored in the 'dragPoint' instance variable, and the corresponding plan for moving that point is stored in the 'plan' instance variable.

The order of messages is:
	1. #beginManipulation
	2-N. #manipulationMoveTo:
	N+1. #endManipulation"

	self constraintPointsDo: [:p |
		dragPoint == p ifTrue: [
			cs addEditVar: p x strength: ClStrength strong.
			cs addEditVar: p y strength: ClStrength strong.
			cs beginEdit.
			^nil]].

	 "drag point not found"
	self error: 'Drag point not found' 