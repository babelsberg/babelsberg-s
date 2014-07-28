initialize
initialize

	initialCompatibilitySetting
		ifNil: [self initialCompatibilitySetting: OSProcess accessor emulateWin32FileLocking]