building
createBoxFromMorph: aMorph
	"This method creates a 3x3 box. The submorphs of the box are copies of aMorph."
	| column box |
	
	column := self createTableOfThreeCellsWithDirection: #topToBottom fromMorph: aMorph.
	box := self createTableOfThreeCellsWithDirection: #leftToRight fromMorph: column.
	^ box