private
removeRow: var 
	"var should be a basic variable, so that the tableau contains the constraint var=expr.  Remove this row, and update the column cross-indices.  Also remove it from infeasibleRows if present.  Answer expr.
	
	var 		<ClAbstractVariable>
	<answer>	<ClLinearExpression>"
	| expr |

	expr := self rows removeKey: var.
	expr terms keysDo: [:v | (self columns at: v) remove: var].
	self infeasibleRows remove: var ifAbsent: [ ].
	^ expr