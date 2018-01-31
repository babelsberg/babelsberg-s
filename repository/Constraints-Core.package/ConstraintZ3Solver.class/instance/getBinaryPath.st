helpers
getBinaryPath

	| defaultPath |
	
	defaultPath := FileDirectory default / 'z3' / 'bin' / ('z3', (OSProcess isWindows ifTrue: ['.exe'] ifFalse:[''])).
	^ (defaultPath exists and: [defaultPath isDirectory not])
		ifTrue: [defaultPath fullName]
		ifFalse: [self findZ3]
