file lock registry
register: fileRegionLock
	"If an object equal to fileRegionLock exists in the registry, answer it. Otherwise, add
	fileRegionLock to the registry and answer fileRegionLock. Caching is enabled when
	EmulateWin32FileLocking is true."

	^ self emulateWin32FileLocking
		ifTrue: [super register: fileRegionLock]
		ifFalse: [fileRegionLock]
