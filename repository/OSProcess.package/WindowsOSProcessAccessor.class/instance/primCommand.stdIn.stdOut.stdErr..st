process creation
primCommand: commandString stdIn: inputFileIoHandle stdOut: outputFileIoHandle stdErr: errorFileIoHandle

	"Run a command in a new external process. The standard input, output and error
	stream handles are sqFile byte arrays (not Win32 HANDLE arrays), and may be nil.
	Answer a result array with hProcess, hThread, dwProcessId, dwThreadId."

	"OSProcess accessor primCommand: 'C:\WINDOWS\SOL' stdIn: nil stdOut: nil stdErr: nil"
	"OSProcess accessor primCommand: 'SOL' stdIn: nil stdOut: nil stdErr: nil"
	"OSProcess accessor primCommand: 'NoSuchProgram' stdIn: nil stdOut: nil stdErr: nil"
	"OSProcess accessor primCommand: 'SOL' stdIn: (FileStream fileNamed: 'output.tmp') fileID stdOut: nil stdErr: nil"

	<primitive: 'primitiveCommandWithInputOutputError' module: 'Win32OSProcessPlugin'>

	^ nil