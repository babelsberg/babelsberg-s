accessing
version

	^ version ifNil: [
		| bin params command outfile proc|
		bin := self binaryPath.
		params := ' -version '.
		OSProcess isWindows
			ifFalse: [ 
				outfile := '/tmp/out.z3v'.
				command :=  '', bin, params, ' > ', outfile]
			ifTrue: [
				outfile := 'tmpout.z3v'.				
				command :=  'cmd /c ', bin, params, ' >', outfile].
		proc := OSProcess command: command.
		[proc update: #runState. proc isRunning] whileTrue: [(Delay forMilliseconds: 10) wait].
		FileStream readOnlyFileNamed: outfile do: [:file | | info |
			info := file upToEnd substrings.
			version := info size > 3 ifTrue:[info third] ifFalse: ['0.0.0']]]
