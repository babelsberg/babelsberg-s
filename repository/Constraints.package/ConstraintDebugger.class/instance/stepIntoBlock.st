context stack menu
stepIntoBlock

	^ [#ccm withLayerDo: [super stepIntoBlock]] ensure: [self constraintChanged]