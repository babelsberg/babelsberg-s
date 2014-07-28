as yet unclassified
initialize

	super initialize.
	p1 := (ClVariable newWith: 10.0 name: 'p1x') @ (ClVariable newWith: 20.0 name: 'p1y').
	p2 := (ClVariable newWith: 110.0 name: 'p2x') @ (ClVariable newWith: 220.0 name: 'p2y').
	cs addStay: p1 x.
	cs addStay: p1 y.
	cs addStay: p2 x.
	cs addStay: p2 y.