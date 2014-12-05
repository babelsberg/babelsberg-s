context stack menu
stepIntoBlock
	
	^ #ccmDebug withLayerDo: [
		[self constraintLayer withLayerDo: [super stepIntoBlock]] ensure: [self constraintChanged]]