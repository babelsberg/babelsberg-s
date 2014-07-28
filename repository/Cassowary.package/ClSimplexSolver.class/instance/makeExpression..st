private
makeExpression: cn
	"Make a new linear expression representing the constraint cn, replacing any basic variables with their defining expressions.  Normalize if necessary so that the constant is non-negative.  If the constraint is non-required give its error variables an appropriate weight in the objective function.

	cn <ClLinearConstraint>"
	| expr cnExpr slackVar dummyVar eplus eminus zRow |

	expr := ClLinearExpression new.
	cnExpr := cn expression.
	expr constant: cnExpr constant.
	cnExpr variablesAndCoefficientsDo: [:v :c | | e |
		e := self rows at: v ifAbsent: [nil].
		e isNil ifTrue: [expr addVariable: v coefficient: c] ifFalse: [expr addExpression: e times: c]].

	"add slack and error variables as needed"
	cn isInequality 
		ifTrue: [
			"cn is an inequality, so add a slack variable.  The original constraint is expr>=0, so that the resulting equality is expr-slackVar=0.  If cn is also non-required add a negative error variable, giving expr-slackVar = -errorVar, in other words expr-slackVar+errorVar=0.  Since both of these variables are newly created we can just add them to the expression (they can't be basic)."
			slackVar := ClSlackVariable new.
			expr terms at: slackVar put: -1.0.

			"index the constraint under its slack variable"
			self markerVars at: cn put: slackVar.
			cn isRequired ifFalse: 
				[eminus := ClSlackVariable new.
				expr terms at: eminus put: 1.0.

				"add eminus to the objective function with the appropriate weight"
				zRow := self rows at: self objective.
				zRow terms at: eminus put: cn strength symbolicWeight * cn weight.
				self errorVars at: cn put: (Array with: eminus).
				self noteAddedVariable: eminus subject: self objective]]
		ifFalse: ["cn is an equality"
			cn isRequired 
				ifTrue: [
					"Add a dummy variable to the expression to serve as a marker for this constraint.  The dummy variable is never allowed to enter the basis when pivoting."
					dummyVar := ClDummyVariable new.
					expr terms at: dummyVar put: 1.0.
					self markerVars at: cn put: dummyVar]
				ifFalse: [
					"cn is a non-required equality.  Add a positive and a negative error variable, making the resulting constraint expr = eplus - eminus, in other words expr-eplus+eminus=0"
					eplus := ClSlackVariable new.
					eminus := ClSlackVariable new.
					expr terms at: eplus put: -1.0.
					expr terms at: eminus put: 1.0.

					"index the constraint under one of the error variables"
					self markerVars at: cn put: eplus.
					zRow := self rows at: self objective.
					zRow terms at: eplus put: cn strength symbolicWeight * cn weight.
					self noteAddedVariable: eplus subject: self objective.
					zRow terms at: eminus put: cn strength symbolicWeight * cn weight.
					self errorVars at: cn put: (Array with: eplus with: eminus).
					self noteAddedVariable: eminus subject: self objective.
					cn isStayConstraint ifTrue: [
						self stayPlusErrorVars: (self stayPlusErrorVars copyWith: eplus).
						self stayMinusErrorVars: (self stayMinusErrorVars copyWith: eminus)].
					cn isEditConstraint ifTrue: [
						self editVars: (self editVars copyWith: cn variable).
						self editConstraints: (self editConstraints copyWith: cn).
						self editPlusErrorVars: (self editPlusErrorVars copyWith: eplus).
						self editMinusErrorVars: (self editMinusErrorVars copyWith: eminus).
						self prevEditConstants: (self prevEditConstants copyWith: cnExpr constant)]]].
	"The constant in the expression should be non-negative.  If necessary normalize the expression by multiplying by -1."
	expr constant < 0 ifTrue: [
		expr constant: 0.0-expr constant.
		expr terms keysAndValuesDo: [:v :c | expr terms at: v put: 0.0-c]].
	^expr