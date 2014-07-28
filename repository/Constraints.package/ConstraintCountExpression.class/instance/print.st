printing
print
	"Create a boolean Z3 variablefor each expression. It represents whether the according expression holds. If the variable is 1, it holds, otherwise it should not hold. The sum of all created expression variables should equal result."
	| printString |
	"printString := 'true)', Character cr."
	printString := '(and '.
	expressions withIndexDo: [:expr :i | 
		printString := printString, expr print, ' (and ', Character cr.].
	printString := printString, resultExpression print, ' true'.
	(1 to: expressions size) do: [:i | printString := printString, ')'].
	^ printString, ')'