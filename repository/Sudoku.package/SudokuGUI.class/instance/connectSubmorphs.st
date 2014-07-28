initialization
connectSubmorphs 

	layoutWrapper addMorph: grid.
	layoutWrapper addMorph: buttonWrapper after: grid. 
	self addMorph: layoutWrapper.
	self addMorph: slider after: layoutWrapper.
	self addMorph: strategyDisplay after: slider.