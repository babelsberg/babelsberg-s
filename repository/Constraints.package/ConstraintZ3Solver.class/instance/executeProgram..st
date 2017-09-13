solving
executeProgram: aString
"This method executes the program by calling the external binary of Z3. The path is defined in self>>binaryPath."
	| bin params proc infile outfile command |
	bin := self binaryPath.
	params := ' -nw -smt2 -T:60 '.
	infile := 'tmp.smt2'.
	outfile := 'out.z3'.				
	OSProcess isWindows
		ifFalse: [
			infile := '/tmp/', infile. 
			outfile := '/tmp/', outfile]
		ifTrue: [
			bin := 'cmd /c ', bin].
	command :=  '', self binaryPath, params, infile, ' > ', outfile.
	FileStream forceNewFileNamed: infile do: [:file | file nextPutAll: aString].
	proc := OSProcess command: command.
	[proc update: #runState. proc isRunning] whileTrue: [(Delay forMilliseconds: 10) wait].
	^ FileStream readOnlyFileNamed: outfile do: [:file | file upToEnd].
