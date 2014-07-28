accessing
variables
	
	| vars |
	vars := OrderedCollection new.
	vars addAll: exprVariables.
	expressions do: [:expr | vars addAll: expr variables].
	^ vars