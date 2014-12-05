solving
binaryPath

"This method detects the path to Z3. The Z3 executable should be at the specified path or in a subfolder of the default folder."
	^ binaryPath ifNil: [| win osx startDir |
		win := OSProcess isWindows.
		osx := OSProcess isUnixMac.
		binaryPath := 'c:\studium\masterarbeit\z3-4.3.0-x64\bin\z3.exe'. "You can specify the path to the Z3 executable here."
		startDir := FileDirectory on: Smalltalk imagePath.
		(startDir fileExists: binaryPath)
			ifFalse: [| exeSuffix z3Directories |
				exeSuffix := win 
								ifTrue: ['.exe'] 
								ifFalse: [osx
									ifTrue: ['-osx']
									ifFalse: ['-linux']].
				z3Directories := startDir directoryNames select: [:dir | dir startsWith: 'z3'].
				z3Directories do: [:z3Dir |
					((startDir / z3Dir / 'bin') fileExists: 'z3')
						ifTrue: [binaryPath := (startDir / z3Dir / 'bin' / 'z3') pathName].
					((startDir / z3Dir / 'bin') fileExists: 'z3', exeSuffix)
						ifTrue: [binaryPath := (startDir / z3Dir / 'bin' / ('z3', exeSuffix)) pathName]].
				(startDir fileExists: binaryPath)
					ifFalse: [self error: 'Cannot find Z3 binary, please add binary path to ', self class name,
												'>>binaryPath method or put a z3 binary download in a subfolder of the default folder.']].
		binaryPath]