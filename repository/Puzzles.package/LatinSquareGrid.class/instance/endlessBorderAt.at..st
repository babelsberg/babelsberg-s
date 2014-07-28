as yet unclassified
endlessBorderAt: x at: y
	"All cells outside the matrix are 0."
	x < 1 ifTrue: [^nil].
	y < 1 ifTrue: [^nil].
	x > nrows ifTrue: [^nil].
	y > ncols ifTrue: [^nil].
	^ self at: x at: y