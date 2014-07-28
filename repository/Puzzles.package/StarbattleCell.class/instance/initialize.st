initialization
initialize

	super initialize.
	starForm := self buildStarForm scaledToSize: self extent.
	minusForm := self buildMinusForm scaledToSize: self extent.
	self
		layoutPolicy: TableLayout new;
		listCentering: #center;
		wrapCentering: #center;
		addImageMorph.
	