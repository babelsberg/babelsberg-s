instance creation
bufferedBlockingPipe
	"Warning: a read on a blocking pipe will hang the VM if there is insufficient
	data in the pipe to fulfill the read request."

	"OSPipe bufferedBlockingPipe"

	^ (super basicNew initialize; setBlocking) setBufferedReader; yourself
