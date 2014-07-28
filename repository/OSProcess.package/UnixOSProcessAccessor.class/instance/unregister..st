file lock registry
unregister: fileRegionLock
	"If an object equal to fileRegionLock exists in the registry, remove it and
	answer the object. Otherwise answer nil. Caching is enabled when
	EmulateWin32FileLocking is true."

	^ self emulateWin32FileLocking
		ifTrue: [super unregister: fileRegionLock]
		ifFalse: [nil]
