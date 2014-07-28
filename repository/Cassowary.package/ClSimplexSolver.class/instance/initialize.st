private
initialize
	| zRow |

	zRow := ClLinearExpression newWithSymbolicWeight.
	self 
		rows: Dictionary new;
		columns: Dictionary new;
		objective: ClObjectiveVariable new;
		infeasibleRows: OrderedCollection new;
		prevEditConstants: Array new;
		stayPlusErrorVars: Array new;
		stayMinusErrorVars: Array new;
		editVars: Array new;
		editConstraints: Array new;
		editPlusErrorVars: Array new;
		editMinusErrorVars: Array new;
		markerVars: Dictionary new;
		errorVars: Dictionary new;
		autoSolve: true.
	self rows at: self objective put: zRow.
