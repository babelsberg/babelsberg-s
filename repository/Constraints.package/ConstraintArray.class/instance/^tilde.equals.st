as yet unclassified
~= aConstraintArray
	"HOTFIX: Please delete this method afterwards!"
	| constraintExpression |
	self size = aConstraintArray size ifFalse: [^true].
	constraintExpression := nil.
	(1 to: self size) do: [:i | | expr |
		expr := (self at: i) = (aConstraintArray at: i).
		constraintExpression 
			ifNil: [constraintExpression := expr]
			ifNotNil: [constraintExpression := constraintExpression & expr]].
	^ constraintExpression not