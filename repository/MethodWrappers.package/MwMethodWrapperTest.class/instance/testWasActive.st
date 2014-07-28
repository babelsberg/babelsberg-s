running
testWasActive

	| wrapper |
	wrapper := self wrapperClass on: #methodOne inClass: MwClassA.
	self deny: wrapper wasActive.
	wrapper install.
	self deny: wrapper wasActive.
	wrapper uninstall.
	self assert: wrapper wasActive.
	self
		should: [wrapper install]
		raise: Error.