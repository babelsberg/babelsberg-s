accessing
at: index put: obj

	Processor activeProcess isConstructingConstraint
		ifTrue: [super at: index put: obj]
		ifFalse: [ | elem |
			elem := super at: index.
			elem isConstraintVariable 
				ifTrue: [elem suggestValue: obj]
				ifFalse: ["Maybe throw an error? or call super at:put:"
						super at: index put: obj]].