testing
testPrimAioModuleVersionString

	| eventHandler versionString |
	eventHandler := AioEventHandler new.
	versionString := eventHandler primAioModuleName.
	self assert: (versionString isKindOf: String)
