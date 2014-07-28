private
resetStayConstants
	"Each of the non-required stays will be represented by an equation of the form
			v = c + eplus - eminus
where v is the variable with the stay, c is the previous value of v, and eplus and eminus are slack variables that hold the error in satisfying the stay constraint.  We are about to change something, and we want to fix the constants in the equations representing the stays.  If both eplus and eminus are nonbasic they have value 0 in the current solution, meaning the previous stay was exactly satisfied.  In this case nothing needs to be changed.  Otherwise one of them is basic, and the other must occur only in the expression for that basic error variable.  Reset the constant in this expression to 0."
	| expr |

	1 to: self stayPlusErrorVars size do: [:i | 
		expr := self rows at: (self stayPlusErrorVars at: i) ifAbsent: [
				self rows at: (self stayMinusErrorVars at: i) ifAbsent: [nil]].
		expr ifNotNil: [expr constant: 0.0]]