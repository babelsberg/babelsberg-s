accessing
expression
	| e |

	e := ClLinearExpression new.
	e constant: self variable value.
	e terms at: self variable put: -1.0.
	^ e