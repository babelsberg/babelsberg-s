copying
fixupPoint: aPoint with: deepCopier
	"Answer a Point that contains the deeply copied counterparts of its x and y values"

	^ (deepCopier references at: aPoint x) @ (deepCopier references at: aPoint y)
	