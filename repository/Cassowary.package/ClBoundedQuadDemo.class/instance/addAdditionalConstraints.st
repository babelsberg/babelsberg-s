initialization
addAdditionalConstraints

	| offset box left right top bottom |

	offset := 2.0.
	box := 0 @ 0 corner: 300 @ 300.
	left := box origin x asFloat + offset.
	right := box corner x asFloat - offset.
	top := box origin y asFloat + offset.
	bottom := box corner y asFloat - offset.

	cs addConstraint: (p1 x cnGEQ: left).  cs addConstraint: (p1 x cnLEQ: right).
	cs addConstraint: (p1 y cnGEQ: top).  cs addConstraint: (p1 y cnLEQ: bottom).
	cs addConstraint: (p2 x cnGEQ: left).  cs addConstraint: (p2 x cnLEQ: right).
	cs addConstraint: (p2 y cnGEQ: top).  cs addConstraint: (p2 y cnLEQ: bottom).
	cs addConstraint: (p3 x cnGEQ: left).  cs addConstraint: (p3 x cnLEQ: right).
	cs addConstraint: (p3 y cnGEQ: top).  cs addConstraint: (p3 y cnLEQ: bottom).
	cs addConstraint: (p4 x cnGEQ: left).  cs addConstraint: (p4 x cnLEQ: right).
	cs addConstraint: (p4 y cnGEQ: top).  cs addConstraint: (p4 y cnLEQ: bottom).