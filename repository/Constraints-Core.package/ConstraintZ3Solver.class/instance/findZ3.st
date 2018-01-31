helpers
findZ3

	"This method detects the path to Z3. The Z3 executable should be at the specified path
	 or in a subfolder of the default folder."

	|  exeSuffix |
	exeSuffix := '-linux'.
	OSProcess isWindows ifTrue: [exeSuffix := '.exe'].
	OSProcess isUnixMac ifTrue: [exeSuffix := '-osx'].

	FileDirectory default directoryNames
		select: [:dir | dir startsWith: 'z3']
		thenDo: [:z3Dir |
			| bin |
			bin := FileDirectory default / z3Dir / 'bin'.
			(bin fileExists: 'z3') ifTrue: [^ (bin / 'z3') fullName].
			(bin fileExists: 'z3', exeSuffix) ifTrue: [^ (bin / ('z3',  exeSuffix)) fullName]].

	self error: 'Cannot find Z3 binary, please add binary path to ', self class name,
			'>>getBinaryPath method or put a z3 binary download in a subfolder of the default folder.'
