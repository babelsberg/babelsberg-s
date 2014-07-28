private
addRow: var expr: expr
	"Add the constraint var=expr to the tableau.  var is now a basic variable.  Update the column cross-indices.

	var <ClAbstractVariable>
	expr <ClLinearExpresson>"

	self rows at: var put: expr.
	expr variablesAndCoefficientsDo: [:v :c | 
		(self columns at: v ifAbsentPut: [Set new]) add: var]