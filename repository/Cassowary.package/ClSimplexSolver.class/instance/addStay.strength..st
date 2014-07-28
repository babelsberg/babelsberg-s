manipulating
addStay: aClVariable strength: aClStrength
	"Add a weak stay to aClVariable at the given strength."

	self addConstraint: (ClStayConstraint variable: aClVariable strength: aClStrength)