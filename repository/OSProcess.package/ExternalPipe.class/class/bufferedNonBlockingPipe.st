instance creation
bufferedNonBlockingPipe

	"OSPipe bufferedNonBlockingPipe"

	^ (super basicNew initialize; setNonBlocking) setBufferedReader; yourself
