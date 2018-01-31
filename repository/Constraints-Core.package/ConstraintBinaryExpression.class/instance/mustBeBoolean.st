as yet unclassified
mustBeBoolean

	self hasCurrentConstraint
		ifTrue: [super mustBeBoolean]
		ifFalse: [
			self operator = '='
				ifTrue: [^ self leftSide == self rightSide].
			
			^ self mustBeBooleanIn: thisContext sender].