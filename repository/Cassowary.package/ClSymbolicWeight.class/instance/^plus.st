operations
+ n
	"Add this symbolic weight to n (which must also be a symbolic weight)"
	| result |

	n isSymbolicWeight ifFalse: [ClError internalError signal].
	result := self class new.
	1 to: self size do: [:i | result at: i put: (self at: i) + (n at: i)].
	^ result