accessing
contents: aText notifying: aController

	^ [#ccm withLayerDo: [super contents: aText notifying: aController]] ensure: [self constraintChanged]