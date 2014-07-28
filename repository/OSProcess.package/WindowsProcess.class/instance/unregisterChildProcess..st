child process management
unregisterChildProcess: anOSProcess

	| p |
	accessProtect critical: [ p := allMyChildren remove: anOSProcess pid ].
	^ p
