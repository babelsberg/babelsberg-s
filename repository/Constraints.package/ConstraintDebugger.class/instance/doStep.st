context stack menu
doStep

	^ #ccmDebug withLayerDo: [[
			self constraintLayer withLayerDo: [super doStep]] ensure: [self constraintChanged]]