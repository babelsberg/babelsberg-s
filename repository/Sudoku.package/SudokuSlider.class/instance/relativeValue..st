accessing
relativeValue: anInteger
	| stepWidth |
	stepWidth := 1.0 / (maxRelativeValue - 1) asFloat .
	self value: anInteger - 1 * stepWidth