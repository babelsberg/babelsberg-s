context stack menu
returnValue

	^ #ccmDebug withLayerDo: [[
		self constraintLayer withLayerDo: [super returnValue]] ensure: [self constraintChanged]]