context stack menu
send
	
	^ #ccmDebug withLayerDo: [
		[self constraintLayer withLayerDo: [super send]] ensure: [self constraintChanged]]