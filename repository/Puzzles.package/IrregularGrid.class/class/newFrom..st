instance creation
newFrom: aMatrix

	| grid |
	grid := self rows: aMatrix rowCount columns: aMatrix columnCount contents: aMatrix asArray deepCopy.
	grid do: [:cell | cell grid: grid].
	grid defineRegions.
	^ grid