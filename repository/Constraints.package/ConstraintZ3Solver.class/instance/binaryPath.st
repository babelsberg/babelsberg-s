solving
binaryPath

	^ binaryPath ifNil: [| win |
		win := OSProcess isWindows.
		binaryPath := win
								ifFalse: ['/usr/local/bin/z3']
								ifTrue: ['c:\studium\masterarbeit\z3-4.3.0-x64\bin\z3.exe'].
		(FileDirectory default fileExists: binaryPath)
			ifFalse: [| z3Dir exeName |
				z3Dir := FileDirectory default directoryNames detect: [:dir | dir startsWith: 'z3'].
				exeName := win ifTrue: ['z3.exe'] ifFalse: ['z3'].
				z3Dir ifNotNil: [binaryPath := FileDirectory default / z3Dir / 'bin'].
				(binaryPath fileExists: exeName)
					ifTrue: [binaryPath := (binaryPath / exeName) pathName]
					ifFalse: [self error: 'Cannot find Z3 binary, please add binary path to ', self class name,
												'>>binaryPath method or put a z3 binary download in a subfolder of the default folder.']].
		binaryPath]