initialization
createConstraints
	| sorted inset spacing winWidth winHeight root |

	"Add stays on each node.  Accumulate the nodes children first, so that the weights on the parents are stronger than those on the children."
	sorted := OrderedCollection new.
	self childrenAndParentsDo: [:lc :rc :p |
		(sorted includes: lc) ifFalse: [sorted add: lc].
		(sorted includes: rc) ifFalse: [sorted add: lc].
		root := p  "we need this at the end"].
	sorted add: root.
	cs addPointStays: sorted.

	inset := self inset.
	spacing := self spacing.
	winWidth := self initialExtent x.
	winHeight := self initialExtent y.
	self childrenAndParentsDo: [:lc :rc :p |
		root := p   "we need the root at the end".

		"children are at equal height"
		cs addConstraint: (lc y cnEqual: rc y).

		"children are below parents"
		cs addConstraint: (p y + spacing cnLEQ: lc y).
		cs addConstraint: (p y + spacing cnLEQ: rc y).

		"parent is centered in the x coordinate between children"
		cs addConstraint: ( (lc x*0.5) + (rc x*0.5) cnEqual: p x).

		"each node lies within the window"
		cs addBounds: lc x lowerBound: inset upperBound: winWidth-inset.
		cs addBounds: rc x lowerBound: inset upperBound: winWidth-inset.
		cs addBounds: lc y lowerBound: inset upperBound: winHeight-inset.
		cs addBounds: rc y lowerBound: inset upperBound: winHeight-inset].
	cs addBounds: root x lowerBound: inset upperBound: winWidth-inset.
	cs addBounds: root y lowerBound: inset upperBound: winHeight-inset.