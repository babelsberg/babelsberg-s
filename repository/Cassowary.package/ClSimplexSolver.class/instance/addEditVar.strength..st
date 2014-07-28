manipulating
addEditVar: aClVariable strength: aClStrength
	"Add aClVariable to the collection of variables being edited."

	self addConstraint: (ClEditConstraint variable: aClVariable strength: aClStrength)