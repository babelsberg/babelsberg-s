accessing
contents: aText notifying: aController

	^ #ccmDebug withLayerDo: [
		[self constraintLayer withLayerDo: [
			super contents: aText notifying: aController]] ensure: [self constraintChanged]]