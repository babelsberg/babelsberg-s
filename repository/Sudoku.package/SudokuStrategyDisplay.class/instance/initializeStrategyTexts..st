initialization
initializeStrategyTexts: anOrderedCollection

	anOrderedCollection do:
		[:strategy| self createLine: (strategy strategyName).].
	
	self addAllMorphs: textLines