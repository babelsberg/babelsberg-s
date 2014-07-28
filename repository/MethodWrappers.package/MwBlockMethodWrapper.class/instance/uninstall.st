installation
uninstall

	self flag: #rhi. "self clientMethod ifNil: [^ self]."
	self beforeBlock ifNotNilDo: [:block | block instVarNamed: 'outerContext' put: nil].
	self flag: #rhi. "self beforeBlock: nil."
	self afterBlock ifNotNilDo: [:block | block instVarNamed: 'outerContext' put: nil].
	self flag: #rhi. "self afterBlock: nil."
	super uninstall.