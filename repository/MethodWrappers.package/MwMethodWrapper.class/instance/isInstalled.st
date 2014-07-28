testing
isInstalled
	self definingClass ifNotNil:
		[:class|
		self clientSelector ifNotNil:
			[:selector|
			^self == (class methodDict at: selector ifAbsent: [])]].
	^false