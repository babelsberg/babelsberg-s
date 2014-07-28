manipulating
removeConstraint: cn
	"Remove the constraint cn to the tableau.  Also remove any error variables associated with cn.

	cn <ClLinearConstraint>"
	| eVars zRow obj marker col minRatio expr coeff r exitVar oldEditMinusErrorVars oldEditPlusErrorVars oldPrevEditConstants oldSize index |

	"We are about to remove a constraint.  There may be some stay constraints that were unsatisfied previously -- if we just removed the constraint these could come into play.  Instead, reset all of the stays so that things should stay where they are at the moment."
	self resetStayConstants.

	"remove any error variables from the objective function"
	eVars := self errorVars removeKey: cn ifAbsent: [#( )].
	zRow := self objective.
	obj := self rows at: zRow.
	eVars do: [:v | 
		expr := self rows at: v ifAbsent: [nil].
		expr isNil
			ifTrue: [obj 
						addVariable: v 
						coefficient: cn strength symbolicWeight * cn weight negated 
						subject: zRow 
						solver: self]
			ifFalse: [obj 
						addExpression: expr 
						times: cn strength symbolicWeight * cn weight negated 
						subject: zRow 
						solver: self]].

	"try to make the marker variable basic if it isn't already"
	marker := self markerVars removeKey: cn.
	(self rows includesKey: marker) ifFalse: [
		"Choose which variable to move out of the basis.  Only consider restricted basic variables."
		col := self columns at: marker.
		col do: [:v | v isRestricted ifTrue: [
			expr := self rows at: v.
			coeff := expr coefficientFor: marker.
			"only consider negative coefficients"
			coeff < 0.0 ifTrue: [
				r := 0.0 - (expr constant / coeff).
				(exitVar isNil or: [r<minRatio]) ifTrue: [minRatio := r.  exitVar := v]]]].
		"If exitVar is still nil at this point, then either the marker variable has a positive coefficient in all equations, or it only occurs in equations for unrestricted variables.  If it does occur in an equation for a restricted variable, pick the equation that gives the smallest ratio.  (The row with the marker variable will become infeasible, but all the other rows will still be feasible; and we will be dropping the row with the marker variable.  In effect we are removing the non-negativity restriction on the marker variable.)"
		exitVar ifNil: [
			col do: [:v | v isRestricted ifTrue: [
				expr := self rows at: v.
				coeff := expr coefficientFor: marker.
				r := expr constant / coeff.
				(exitVar isNil or: [r<minRatio]) ifTrue: [minRatio := r.  exitVar := v]]]].
		exitVar ifNil: [
			"exitVar is still nil.  If col is empty, then exitVar doesn't occur in any equations, so just remove it.  Otherwise pick an exit var from among the unrestricted variables whose equation involves the marker var."
			col isEmpty
				ifTrue: [self removeParametricVar: marker]
				ifFalse: [exitVar := col asOrderedCollection first]].
		exitVar ifNotNil: [self pivot: marker exitVar: exitVar]].

	"Delete any error variables.  If cn is an inequality, it also contains a slack variable; but we use that as the marker variable and so it has been deleted when we removed its row."
	(self rows includesKey: marker) ifTrue: [self removeRow: marker].
	eVars do: [:v | v=marker ifFalse: [self removeParametricVar: v]].
	cn isStayConstraint ifTrue: [
		self stayPlusErrorVars: (self stayPlusErrorVars reject: [:v | eVars includes: v]).
		self stayMinusErrorVars: (self stayMinusErrorVars reject: [:v | eVars includes: v])].
	cn isEditConstraint ifTrue: [
		"find the index in editPlusErrorVars of the error variable for this constraint"
		index := self findEditErrorIndex: eVars.
		oldSize := self editPlusErrorVars size.

		"remove the error variables from editPlusErrorVars and editMinusErrorVars"
		oldEditPlusErrorVars := self editPlusErrorVars.
		self editPlusErrorVars: (Array new: oldSize-1).
		1 to: index-1 do: [:i | 
			self editPlusErrorVars at: i put: (oldEditPlusErrorVars at: i)].
		index+1 to: oldSize do: [:i | 
			self editPlusErrorVars at: i-1 put: (oldEditPlusErrorVars at: i)].
		oldEditMinusErrorVars := self editMinusErrorVars.
		self editMinusErrorVars: (Array new: oldSize-1).
		1 to: index-1 do: [:i | 
			self editMinusErrorVars at: i put: (oldEditMinusErrorVars at: i)].
		index+1 to: oldSize do: [:i | 
			self editMinusErrorVars at: i-1 put: (oldEditMinusErrorVars at: i)].

		"remove the constants from prevEditConstants"
		oldPrevEditConstants := self prevEditConstants.
		self prevEditConstants: (Array new: oldSize-1).
		1 to: index-1 do: [:i | 
			self prevEditConstants at: i put: (oldPrevEditConstants at: i)].
		index+1 to: oldSize do: [:i | 
			self prevEditConstants at: i-1 put: (oldPrevEditConstants at: i)]].

	self autoSolve ifTrue: [
		self optimize: zRow.
		self setExternalVariables]