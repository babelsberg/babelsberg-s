initialize - release
setDefaults

	| this |
	this := OSProcess thisOSProcess.
	initialEnvironment ifNil: [self initialEnvironment: this environment].
	initialStdIn ifNil: [self initialStdIn: this stdIn].
	initialStdOut ifNil: [self initialStdOut: this stdOut].
	initialStdErr ifNil: [self initialStdErr: this stdErr].	
	self pwd

