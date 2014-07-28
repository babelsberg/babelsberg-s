comparing
= n

	n isSymbolicWeight ifFalse: [^false].
	1 to: self size do: [:i | 
		(self at: i) = (n at: i) ifFalse: [^false]].
	"all elements were equal"
	^ true