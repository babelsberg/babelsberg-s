accessing
regionWithIdentifier: aCharacter

	| region |
	region := OrderedCollection new.
	self withIndicesDo: [:cell :row :col | 
		cell regionId = aCharacter ifTrue: [region add: (self at: row at: col)]].
	^ region