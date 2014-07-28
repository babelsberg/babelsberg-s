installation
uninstall

	self handlerBlock ifNotNilDo: [:block | block instVarNamed: 'outerContext' put: nil].
	self flag: #rhi. "self handlerBlock: nil."
	super uninstall.