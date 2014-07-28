testing
testPrimAioModuleName

	| eventHandler moduleName |
	eventHandler := AioEventHandler new.
	moduleName := eventHandler primAioModuleName.
	self assert: ('AioPlugin*' match: moduleName)
