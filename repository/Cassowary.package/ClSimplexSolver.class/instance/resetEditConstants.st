private
resetEditConstants
	"Each of the non-required edits will be represented by an equation of the form
		v = c + eplus - eminus
where v is the variable with the edit, c is the previous edit value, and eplus and eminus are slack variables that hold the error in satisfying the edit constraint.  We are about to change something, and we want to fix the constants in the equations representing the edit constraints.  If one of eplus and eminus is basic, the other must occur only in the expression for that basic error variable.  (They can't both be basic.)  Fix the constant in this expression.  Otherwise they are both nonbasic.  Find all of the expressions in which they occur, and fix the constants in those.  See the UIST paper for details."
	| delta nn pp |

	self newEditConstants size = self editPlusErrorVars size ifFalse: [
		"number of edit constants doesn't match the number of edit error variables"
		ClError internalError signal].
	1 to: self newEditConstants size do: [:i |
		nn := self newEditConstants.
		pp := self prevEditConstants.
		nn isNil ifTrue: [self halt].
		self prevEditConstants isNil ifTrue: [self halt].
		(self newEditConstants at: i) ifNil: [
			Transcript cr; show: self newEditConstants printString.
			self halt].
		(self prevEditConstants at: i) ifNil: [self halt].
		delta := (self newEditConstants at: i) - (self prevEditConstants at: i).
		self prevEditConstants at: i put: (self newEditConstants at: i).
		self 
			deltaEditConstant: delta
			plusErrorVar: (self editPlusErrorVars at: i)
			minusErrorVar: (self editMinusErrorVars at: i)].