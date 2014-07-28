examples
testEnvSet
	"Set up a new environment for a child process. Exec a shell to show the 
	environment variables on the terminal standard output. Note that many 
	shells will set other environment variables in addition to those which we
	set up prior to executing the shell."

	"UnixProcess testEnvSet"

	| e proc |
	e := Dictionary new.
	e at: #KEY1 put: 'value1';
	 at: #KEY2 put: 'value2';
	 at: #KEY3 put: 'value3'.
	proc := self
			forkJob: '/bin/sh'
			arguments: #('-c' 'env' )
			environment: e
			descriptors: nil.
	proc ifNil: [self noAccessorAvailable].
	^ proc