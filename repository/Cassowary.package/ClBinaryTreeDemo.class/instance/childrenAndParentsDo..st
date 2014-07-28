enumerating
childrenAndParentsDo: aBlock
	"Evaluate aBlock for all children and parents, starting with leaves and going up the tree."
	| parentcount left right parent |

	height to: 2 by: -1 do: [:h |
		parentcount := 2 raisedTo: h-2.
		1 to: parentcount do: [:i | 
			left := nodes at: (100*h)+(2*i)-1.
			right := nodes at: (100*h)+(2*i).
			parent := nodes at: (100*(h-1))+i.
			aBlock 
				value: left 
				value: right 
				value: parent]]