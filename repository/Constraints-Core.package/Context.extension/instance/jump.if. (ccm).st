*Constraints-Core
jump: distance if: condition
	<layer: #ccm>
	| constraintExpr |
	(self top isConstraintExpression) ifTrue: [
		constraintExpr := self pop.
		"The following code handles different kind of loops on collections. This is necessary for allSatisfy:, anySatisfy: and noneSatifsfy:. It is also possible to handle notAllSatisfy:, which does not exist yet. All loops are like:
		self do: [:each | (aBlock value: each) ifTrue/ifFalse: [^ true/false]]. 
		The code handles the three cases that are used by all/any/noneSatisfy:."
		self willReturn 
			ifTrue: [| bytecode |
				bytecode := self method at: self pc.
				condition 
					ifFalse: ["ifTrue:"
						bytecode = 121 ifTrue: ["returnTrue --> connect all expressions with or, if possible (anySatisfy:)"
							constraintExpr addExpressionToConstraint: self currentConstraint.
							self push: condition not "Currently, always the first expression will be true. So, the loop block will return."].
						bytecode = 122 ifTrue: ["returnFalse --> negate constraintExpr (noneSatisfy:)
							If the solver is Cassowray, throw an error, because Cassowary cannot negate arbitrary expressions."
							| negatedExpr |
							self currentConstraint isConstraintCassowary
								ifTrue: [self error: 'Cassowary cannot negate arbitrary constraints. 
									Therefore, the current constraint cannot be solved.'].
							negatedExpr := constraintExpr negated.
							negatedExpr addExpressionToConstraint: self currentConstraint.
							self push: condition "should not return --> Expressions inside the loop are connected with 'and'."]]
					ifTrue: ["ifFalse:"
						bytecode = 122 ifTrue: ["returnFalse --> connect all expressions with and, which is done implicitly"
							constraintExpr addExpressionToConstraint: self currentConstraint.
							self push: condition "should not return --> Expressions inside the loop are connected with 'and'."]]]
			ifFalse: ["ifFalse: --> Should be allSatisfy:, but can also be something like notAllSatisfy:." 
					constraintExpr addExpressionToConstraint:  self currentConstraint.
					self push: condition not]].
	^ self proceed: distance with: condition
