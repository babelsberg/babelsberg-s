initialization
initialize

	super initialize.
	p1 := (ClVariable newWith: 100.0) @ (ClVariable newWith: 100.0).
	p2 := (ClVariable newWith: 200.0) @ (ClVariable newWith: 100.0).
	m1 := (ClVariable newWith: 150.0) @ (ClVariable newWith: 100.0).

	p1 x name: 'p1x'.
	p1 y name: 'p1y'.
	p2 x name: 'p2x'.
	p2 y name: 'p2y'.
	m1 x name: 'm1x'.
	m1 y name: 'm1y'.

	"add stays on the corner points"
	cs addPointStays: (Array with: p1 with: p2).

	"set up the midpoint constraints"
	cs addConstraint: (p1 x + p2 x cnEqual: m1 x * 2.0).
	cs addConstraint: (p1 y + p2 y cnEqual: m1 y * 2.0).