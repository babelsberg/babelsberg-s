*Cassowary
asLinearExpression
	"Coerce this number to be a ClLinearExpression."
	| expr |

	expr := ClLinearExpression new.
	expr constant: self asFloat.
	^ expr