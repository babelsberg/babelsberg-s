updating
update: aParameter

	aParameter == #invalidProcessAccessor ifTrue: [processAccessor := nil].
	^ super update: aParameter