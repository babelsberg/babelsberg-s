copying
veryDeepFixupWith: deepCopier
	"If some fields were weakly copied, fix new copy here."

	super veryDeepFixupWith: deepCopier.

	"nodes is a Dictionary of Points; fix the points"
	nodes keysAndValuesDo: [:key :point |
		nodes at: key put: (self fixupPoint: point with: deepCopier)].
	
	"lines is a Dictionary of Arrays of Points; fix the points"
	lines keysAndValuesDo: [:key :pointArray |
		lines
			at: key
			put: (pointArray collect: [:pt | self fixupPoint: pt with: deepCopier])].