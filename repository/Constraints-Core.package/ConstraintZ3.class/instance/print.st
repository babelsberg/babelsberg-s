printing
print

	| exprString |
	exprString := ''.
	self expressions do: [:expr | exprString := exprString, '(assert ', expr print, ')', Character cr].
	^ exprString