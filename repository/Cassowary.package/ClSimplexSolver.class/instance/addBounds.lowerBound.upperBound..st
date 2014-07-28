manipulating
addBounds: var lowerBound: lower upperBound: upper
	"Add constraints so that lower<=var<=upper (nil means no bound)

	var		<ClVariable>
	lower	<Number | nil>
	upper	<Number | nil>"

	lower ifNotNil: [self addConstraint: (lower cnLEQ: var)].
	upper ifNotNil: [self addConstraint: (var cnLEQ: upper)]