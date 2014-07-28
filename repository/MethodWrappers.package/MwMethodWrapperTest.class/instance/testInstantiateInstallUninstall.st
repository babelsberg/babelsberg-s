running
testInstantiateInstallUninstall

	| wrapper instance |
	wrapper := self wrapperClass on: #methodOne inClass: MwClassA.
	instance := MwClassA new.
	instance methodOne.
	wrapper install.
	instance methodOne.
	wrapper uninstall.
	instance methodOne.