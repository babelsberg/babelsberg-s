context stack menu
doStep

	^ [#ccm withLayerDo: [super doStep]] ensure: [self constraintChanged]