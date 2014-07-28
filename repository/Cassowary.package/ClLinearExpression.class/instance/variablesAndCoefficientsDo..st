enumerating
variablesAndCoefficientsDo: aBlock
	"Evaluate aBlock with each variable-coefficient pair asArguments.

	aBlock <Block [ClConstrainableVariable,Number]>"

	self terms keysAndValuesDo: [:v :c | aBlock value: v value: c]