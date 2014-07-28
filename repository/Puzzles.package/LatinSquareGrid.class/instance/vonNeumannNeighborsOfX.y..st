as yet unclassified
vonNeumannNeighborsOfX: x y: y

	| result neighborDiffs |
	result := OrderedCollection new.
	neighborDiffs := {0@(-1). 0@1. (-1)@0. 1@0}.
	neighborDiffs do: [:diff | | cell |
		cell := self endlessBorderAt: x + diff x at: y + diff y.
		cell ifNotNil: [result add: cell]].
	^ result