as yet unclassified
mooreNeighborsOfX: x y: y

	| result |
	result := OrderedCollection new.
	(-1 to: 1) do: [:xDiff |
		(-1 to: 1) do: [:yDiff | | cell |
			cell := self endlessBorderAt: x+xDiff at: y+yDiff.
			cell ifNotNil: [
				(xDiff = 0 & yDiff = 0) ifFalse: [result add: cell]]]].
	^ result