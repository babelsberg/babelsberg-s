manipulating
addStay: aConstraintVariable

	aConstraintVariable solver = self
		ifFalse: [self error: 'Called addStay on another solver than that of the given constraint variable.'].

	aConstraintVariable stay.