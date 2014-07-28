instance creation
buildFromString: aString

	| charList grid puzzleSize |
	charList := OrderedCollection new.
	aString substrings collect: [:row | row do: [:char | charList add: char]].
	puzzleSize := charList size sqrt.
	grid := self new: puzzleSize element: 0.
	grid 
		buildGridCellsFrom: charList;
		defineRegions;
		buildGUI.

	^ grid