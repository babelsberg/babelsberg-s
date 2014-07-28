private
pivot: entryVar exitVar: exitVar
	"Do a pivot.  Move entryVar into the basis (i.e. make it a basic variable), and move exitVar out of the basis (i.e. make it a parametric variable)."
	| expr |

	"expr is the expression for the exit variable (about to leave the basis) -- so that the old tableau includes the equation exitVar = expr"
	expr := self removeRow: exitVar.

	"Compute an expression for the entry variable.  Since expr has been deleted from the tableau we can destructively modify it to build this expression."
	expr changeSubject: exitVar newSubject: entryVar.
	self substituteOut: entryVar expr: expr.
	self addRow: entryVar expr: expr.