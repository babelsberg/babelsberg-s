calculation
calculationInNormalMode

	self applyStrategy
		ifFalse: [self inform: 'No Strategy found!'.
				^false]. 
		self storeCandidates.
		historySlider 
			value: 1;
			maxRelativeValue: candidatesHistory size.
	^true