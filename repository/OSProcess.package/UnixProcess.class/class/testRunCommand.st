examples
testRunCommand
	"Run the command 'ls -l /etc /etc/noSuchFile'. The output of the 
	command will be in the file '/tmp/deleteMe.out', and the error output
	will be in '/tmp/deleteMe.err'. "

	"UnixProcess testRunCommand"

	| out err desc args proc |
	out := FileStream newFileNamed: '/tmp/deleteMe.out'.
	err := FileStream newFileNamed: '/tmp/deleteMe.err'.
	desc := Array
				with: nil
				with: out
				with: err.
	args := Array
				with: '-l'
				with: '/etc'
				with: '/etc/noSuchFile'
				with: '/etc/anotherNonexistentFile'.
	proc := self
				forkJob: '/bin/ls'
				arguments: args
				environment: nil
				descriptors: desc.
	proc ifNil: [self noAccessorAvailable].
	out close.
	err close.
	^ proc