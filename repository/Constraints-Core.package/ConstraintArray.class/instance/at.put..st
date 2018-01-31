accessing
at: index put: obj
	
	self isConstructingConstraint
		ifFalse: [ | elem |
			elem := super at: index.
			elem isConstraintVariable 
				ifTrue: [^ elem suggestValue: obj]].

	super at: index put: obj.