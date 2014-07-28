solving
executeProgram: aString
"This method executes the program by calling the external binary of Z3. The path is defined in self>>binaryPath."
	| bin out parms proc |
	out := ''.
	bin := self binaryPath.
	parms := ' -nw -smt2 -T:60 '.
	OSProcess isWindows
		ifFalse: [
			(StandardFileStream forceNewFileNamed: '/tmp/tmp.smt2') nextPutAll: aString; close.
			proc := ExternalUnixOSProcess command: '', bin, parms, ' /tmp/tmp.smt2 > /tmp/out.z3'.
			[proc update: #runState. proc isRunning] whileTrue: [(Delay forMilliseconds: 10) wait].
			out := (StandardFileStream readOnlyFileNamed: '/tmp/out.z3') upToEnd]
		ifTrue: [	
			(StandardFileStream forceNewFileNamed: 'tmp.smt2') nextPutAll: aString; close.
			proc := ExternalWindowsOSProcess command: 'cmd /c ', bin, parms, ' tmp.smt2 > out.z3'.
			[proc update: #runState. proc isRunning] whileTrue: [(Delay forMilliseconds: 10) wait].
			out := (StandardFileStream readOnlyFileNamed: 'out.z3') upToEnd].
	^ out