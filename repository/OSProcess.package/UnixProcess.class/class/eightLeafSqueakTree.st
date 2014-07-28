examples
eightLeafSqueakTree
	"Clone this squeak three times, resulting in a total of (2 raisedTo: 3) nearly identical
	squeaks. Have a look at the pidArray inspectors and to the debug messages on stdout
	in order to see what is going on. The tree of processes looks like this:

	111
	 +--------+--------+
	 |		 |		 |
	011		101		110
	 +---+	 |
	 |	 |	100
	010	001
		 |
		000
	"

	"UnixProcess eightLeafSqueakTree inspect"

	| depth this pidArray debugString |
	depth := 3.
	this := OSProcess thisOSProcess.
	this stdOut ifNil: [self noAccessorAvailable. ^ nil].
	pidArray := Array new: depth.
	(1 to: depth) do: [ :e | | p pid |
		p := this forkSqueak.
		pid := (p == this) ifTrue: [0] ifFalse: [p pid].	"Use Unix fork(2) convention"
		pidArray at: e put: pid].
	debugString := 'pid ', (this pid printString), ' ppid ', (this ppid printString), ' ',
		(pidArray printString), (Character lf asString).
	this stdOut nextPutAll: debugString.
	^ pidArray