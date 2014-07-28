manipulating
addPointStays: points
	"Add weak stays to the x and y parts of each point.  These have declining weights so that the solver will try to satisfy the x and y stays on the same point, rather than the x stay on one and the y stay on another."
	| wght mult |

	mult := 2.0.		"amount to multiply by the weight each time"
	wght := 1.0.
	points do: [:p |
		self addConstraint: (ClStayConstraint variable: p x strength: ClStrength weak weight: wght).
		self addConstraint: (ClStayConstraint variable: p y strength: ClStrength weak weight: wght).
		wght := wght * mult]