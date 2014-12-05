as yet unclassified
printGrid

	(1 to: self rowCount) do: [:row |
		(1 to: self columnCount) do: [:column |
			((self at: row at: column) isStar size = 0)
				ifTrue: [Transcript show: 'x'; tab].
			((self at: row at: column) isStar size = 1)
				ifTrue: [Transcript show: (self at: row at: column) isStar first; tab]
				ifFalse: [Transcript show: '.'; tab]].
		Transcript cr].