context stack menu
restart

	^ #ccmDebug withLayerDo: [
		[self constraintLayer withLayerDo: [super restart]] ensure: [self constraintChanged]]