as yet unclassified
printGrid

	(1 to: self rowCount) do: [:row |
		(1 to: self columnCount) do: [:column |
			((self at: row at: column) size = 1)
				ifTrue: [Transcript show: (self at: row at: column) first asString; tab]
				ifFalse: [Transcript show: '.'; tab]].
		Transcript cr].