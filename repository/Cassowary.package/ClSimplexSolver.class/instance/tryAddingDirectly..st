private
tryAddingDirectly: expr
	"We are trying to add the constraint expr=0 to the appropriate tableau.  Try to add expr directly to the tableax without creating an artificial variable.  Return true if successful and false if not.

	expr <ClLinearExpresson>"
	| subject |		

	"If possible choose a subject for expr (a variable to become basic) from among the current variables in expr.  If this isn't possible, add an artificial variable and use that variable as the subject."
	subject := self chooseSubject: expr.
	subject isNil ifTrue: [^false].
	expr newSubject: subject.
	(self columns includesKey: subject) ifTrue: [self substituteOut: subject expr: expr].
	self addRow: subject expr: expr.
	^ true