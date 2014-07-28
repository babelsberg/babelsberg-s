comparing
< n
	| a b |
	n isSymbolicWeight ifFalse: [ClError internalError signal].
	1 to: self size do: [:i | 
		a := self at: i.  
		b := n at: i.
		a<b ifTrue: [^true].
		a>b ifTrue: [^false]
		"they're equal ... keep going"].
	"all elements were equal"
	^ false