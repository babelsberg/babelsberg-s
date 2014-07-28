drawing
drawForegroundOn: aCanvas
	| begin end |

	"Draw the four sides of the quadrilateral."
	begin := {p1. p2. p3. p4} collect: [:p | p valuePoint + self position].
	end := {p2. p3. p4. p1} collect: [:p | p valuePoint + self position].
	begin with: end do: [:b :e |
		aCanvas line: b to: e width: 3 color: Color white].

	"Draw the lines between the midpoints."
	begin := {m1. m2. m3. m4} collect: [:m | m valuePoint + self position].
	end := {m2. m3. m4. m1} collect: [:m | m valuePoint + self position].
	begin with: end do: [:b :e |
		aCanvas line: b to: e width: 2 color: Color yellow].
