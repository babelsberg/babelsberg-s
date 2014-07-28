operations
* n
	"Multiply this symbolic weight by n (n should be a number)"
	| result |

	n isNumber ifFalse: [ClError internalError signal].
	result := self class new.
	1 to: self size do: [:i | result at: i put: n*(self at: i)].
	^ result