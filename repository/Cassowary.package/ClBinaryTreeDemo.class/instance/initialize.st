initialization
initialize
	| xspace yspace index nleaves nodecount left right px |

	xspace := 20.  
	yspace := 20.

	super initialize.
	nodes := Dictionary new.
	
	"create the leaves"
	nleaves := 2 raisedTo: height-1.
	1 to: nleaves do: [:i | index := 100*height + i.  nodes at: index put: 
			((ClVariable newWith: (xspace*i) asFloat name: 'n' , index printString , 'x') @ 
			  (ClVariable newWith: (yspace*height) asFloat name: 'n' , index printString , 'y'))].

	"create the other nodes"
	height-1 to: 1 by: -1 do: [:h |
		nodecount := 2 raisedTo: h-1.
		1 to: nodecount do: [:i | 
			left := nodes at: (100*(h+1))+(2*i)-1.  
			right := nodes at: (100*(h+1))+(2*i).
			px := (left x value + right x value) * 0.5.
			index := 100*h+ i.  nodes at: index put: 
			((ClVariable newWith: px name: 'n' , index printString , 'x') @ 
			  (ClVariable newWith: yspace*h name: 'n' , index printString , 'y'))]].

	lines := OrderedCollection new.
	self childrenAndParentsDo: [:lc :rc :p | 
		lines add: (Array with: p with: lc).
		lines add: (Array with: p with: rc)].

	self createConstraints.