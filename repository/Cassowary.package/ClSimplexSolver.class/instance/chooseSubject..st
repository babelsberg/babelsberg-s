private
chooseSubject: expr
	"We are trying to add the constraint expr=0 to the tableaux.  Try to choose a subject (a variable to become basic) from among the current variables in expr.  If expr contains any unrestricted variables, then we must choose an unrestricted variable as the subject.  Also, if the subject is new to the solver we won't have to do any substitutions, so we prefer new variables to ones that are currently noted as parametric.  If expr contains only restricted variables, if there is a restricted variable with a negative coefficient that is new to the solver we can make that the subject.  Otherwise we can't find a subject, so return nil.  (In this last case we have to add an artificial variable and use that variable as the subject -- this is done outside this method though.)

	Note:  in checking for variables that are new to the solver, we ignore whether a variable occurs in the objective function, since new slack variables are added to the objective function by 'makeExpression:', which is called before this method.

	expr <ClLinearExpression>
	<answers> <ClAbstractVariable | nil>"
	| subject foundUnrestricted foundNewRestricted coeff |

	"The temporaries are as follows:
		subject <ClAbstractVariable | nil> -- nil or the current best subject
		foundUnrestricted <Boolean> -- true if we have found a subject that is an unrestricted variable
		foundNewRestricted <Boolean> -- true if we have found a restricted variable that is new to the solver (except for being in the objective function) and that has a negative coefficient."

	foundUnrestricted := false.  
	foundNewRestricted := false.
	expr variablesAndCoefficientsDo: [:v :c | | col | 
		foundUnrestricted 
			ifTrue: [
				"We have already found an unrestricted variable.  The only time we will want to use v instead of the current choice 'subject' is if v is unrestricted and new to the solver and 'subject' isn't new.  If this is the case just pick v immediately and return."
				v isRestricted ifFalse: [(self columns includesKey: v) ifFalse: [^v]]]
			ifFalse: [
				"we haven't found an unrestricted variable yet"
				v isRestricted 
					ifTrue: [
						"v is restricted.  If we have already found a suitable restricted variable just stick with that.  Otherwise, if v is new to the solver and has a negative coefficient pick it.  Regarding being new to the solver -- if the variable occurs only in the objective function we regard it as being new to the solver, since error variables are added to the objective function when we make the expression.  We also never pick a dummy variable here."
						(foundNewRestricted not and: [v isDummy not and: [c<0.0]]) ifTrue: [
							col := self columns at: v ifAbsent: [nil].
							(col isNil or: [col size=1 and: [col includes: self objective]]) ifTrue: [
								subject := v.
								foundNewRestricted := true]]]
					ifFalse: [
						"v is unrestricted.  If v is also new to the solver just pick it now"
						(self columns includesKey: v) ifFalse: [^v].
						subject := v.
						foundUnrestricted := true]]].

	"subject is nil.  Make one last check -- if all of the variables in expr are dummy variables, then we can pick a dummy variable as the subject."
	subject isNil ifFalse: [^subject].
	expr variablesAndCoefficientsDo: [:v :c | 
		v isDummy ifFalse: [^nil   "nope - no luck"].
		"if v is new to the solver tentatively make it the subject"
		(self columns includesKey: v) ifFalse: [subject := v.  coeff := c]].

	"If we get this far, all of the variables in the expression should be dummy variables.  If the constant is nonzero we are trying to add an unsatisfiable required constraint.  (Remember that dummy variables must take on a value of 0.)  Otherwise, if the constant is zero, multiply by -1 if necessary to make the coefficient for the subject negative."
	(expr constant clApproxZero) ifFalse: [ClError requiredFailure signal].
	coeff > 0 ifTrue: [
		expr terms keysAndValuesDo: [:v :c | expr terms at: v put: 0.0-c]].
	^subject