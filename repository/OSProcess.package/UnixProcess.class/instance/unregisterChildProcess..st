child process management
unregisterChildProcess: anOSProcess

	accessProtect
		critical: [allMyChildren
				removeKey: self pid
				ifAbsent: []].
	^ anOSProcess
