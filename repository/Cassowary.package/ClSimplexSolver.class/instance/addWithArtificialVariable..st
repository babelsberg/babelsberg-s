private
addWithArtificialVariable: expr
	"Add the constraint expr=0 to the inequality tableau using an artificial variable.  To do this, create an artificial variable av and add av=expr to the inequality tableau, then make av be 0. (Raise an exception if we can't attain av=0.)

	expr <ClLinearExpresson>"
	| av az azRow |

 	av := ClSlackVariable new.
	az := ClObjectiveVariable new.
	azRow := ClLinearExpression new.

	"the artificial objective is av, which we know is equal to expr (which contains only parametric variables)"
	azRow constant: expr constant.
	expr terms keysAndValuesDo: [:v :c | azRow terms at: v put: c].
	self addRow: az expr: azRow.
	self addRow: av expr: expr.

	"try to optimize av to 0"
	self optimize: az.

	"Check that we were able to make the objective value 0.  If not, the original constraint was unsatisfiable."
	(azRow constant clApproxZero) ifFalse: [ClError requiredFailure signal].

	"see if av is a basic variable"
	self rows at: av ifPresent: [:e | | entryVar |
		"Find another variable in this row and pivot, so that av becomes parametric.  If there isn't another variable in the row then the tableau contains the equation av=0 -- just delete av's row."
		e isConstant ifTrue: [self removeRow: av.  ^nil].
		entryVar := e anyVariable.
		self pivot: entryVar exitVar: av].

	"av should be parametric at this point"
	self removeParametricVar: av.

	"remove the temporary objective function"
	self removeRow: az.
