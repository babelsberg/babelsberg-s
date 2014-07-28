examples
catAFile
	"Copy contents of a file to standard output. This demonstrates reassigning stdin to an open FileStream."

	"UnixProcess catAFile"

	| in proc |
	in := FileStream readOnlyFileNamed: '/etc/hosts'.
	proc := self forkJob: '/bin/cat'
			arguments: nil
			environment: nil
			descriptors: (Array with: in with: nil with: nil).
	in close.
	proc ifNil: [self noAccessorAvailable].
	^ proc