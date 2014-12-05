solving
binaryPath

"This method detects the path to Z3. The Z3 executable should be at the specified path or in a subfolder of the default folder."
	^ binaryPath ifNil: [| win osx startDir |
		win := OSProcess isWindows.
		osx := OSProcess isUnixMac.
		binaryPath := 'c:\studium\masterarbeit\z3-4.3.0-x64\bin\z3.exe'. "You can specify the path to the Z3 executable here."
		startDir := FileDirectory on: Smalltalk imagePath.
		(startDir fileExists: binaryPath)
			ifFalse: [| exeName z3Directories |
				exeName := win 
								ifTrue: ['z3.exe'] 
								ifFalse: [osx
									ifTrue: ['z3-osx']
									ifFalse: ['z3-linux']].
				z3Directories := startDir directoryNames select: [:dir | dir startsWith: 'z3'].
				z3Directories do: [:z3Dir | ((startDir / z3Dir / 'bin') fileExists: exeName)
					ifTrue: [binaryPath := (startDir / z3Dir / 'bin' / exeName) pathName]].
				(startDir fileExists: binaryPath)
					ifFalse: [self error: 'Cannot find Z3 binary, please add binary path to ', self class name,
												'>>binaryPath method or put a z3 binary download in a subfolder of the default folder.']].
		binaryPath]