running
testInstallInstantiateUninstall

	| wrapper instance |
	wrapper := self wrapperClass on: #methodOne inClass: MwClassA.
	wrapper install.
	instance := MwClassA new.
	instance methodOne.
	wrapper uninstall.
	instance methodOne.