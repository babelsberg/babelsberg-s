examples
clientServerDemo2
	"Start a new instance of Squeak running in a child OS process. The new 
	instance is a nearly identical copy of its parent, resuming execution at
	the same point as the parent. The child process will run a TCP server
	process, then exit. Test results are written to the Transcript. "

	"UnixProcess clientServerDemo2"

	| remotePort remoteHost serverBlock socket buffer n bytesToSend sendBuf
	receiveBuf done bytesSent bytesReceived packetsSent packetsReceived t |

	remotePort := 54321.
	remoteHost := 'localhost'.
	serverBlock := 
			[Transcript clear; cr; show: 'This is the server Squeak session'; cr.
			Socket initializeNetworkIfFail: [^ nil].
			socket := Socket newTCP.
			socket listenOn: remotePort.
			buffer := String new: 4000.
			socket waitForConnectionUntil: Socket standardDeadline.
			[socket isConnected]
				whileTrue: [socket dataAvailable
						ifTrue: 
							[n := socket receiveDataInto: buffer.
							socket sendData: buffer count: n]].
			socket closeAndDestroy].

	(UnixProcess forkSqueakAndDoThenQuit: serverBlock)
		ifNil: [self noAccessorAvailable. ^ nil].
	Transcript cr; show: 'This is the client Squeak session'; cr.
	Transcript show: 'starting client/server TCP test'; cr.
	Transcript show: 'initializing network ... '.
	Socket initializeNetworkIfFail: [^ Transcript show: 'failed'].
	Transcript show: 'ok'; cr.
	socket := Socket newTCP.
	socket connectTo: (NetNameResolver addressForName: remoteHost) port: remotePort.
	socket waitForConnectionUntil: Socket standardDeadline.
	Transcript show: 'client endpoint created'; cr.
	bytesToSend := 1000000.
	sendBuf := String new: 4000 withAll: $x.
	receiveBuf := String new: 50000.
	done := false.
	bytesSent := bytesReceived := packetsSent := packetsReceived := 0.
	t := Time
				millisecondsToRun: 
					[[done]
						whileFalse: 
							[(socket sendDone and: [bytesSent < bytesToSend])
								ifTrue: 
									[packetsSent := packetsSent + 1.
									bytesSent := bytesSent + (socket sendData: sendBuf)].
							socket dataAvailable
								ifTrue: 
									[packetsReceived := packetsReceived + 1.
									bytesReceived := bytesReceived + (socket receiveDataInto: receiveBuf)].
							done := bytesSent >= bytesToSend].
					[bytesReceived < bytesToSend]
						whileTrue: [socket dataAvailable
								ifTrue: 
									[packetsReceived := packetsReceived + 1.
									bytesReceived := bytesReceived + (socket receiveDataInto: receiveBuf)]]].
	socket closeAndDestroy.
	Transcript show: 'remoteClient TCP test done; time = ' , t printString; cr.
	Transcript show: packetsSent printString , ' packets, ' , bytesSent printString ,
		' bytes sent (' , (bytesSent * 1000 // t) printString , ' bytes/sec)'; cr.
	Transcript show: packetsReceived printString , ' packets, ' , bytesReceived printString ,
		' bytes received (' , (bytesReceived * 1000 // t) printString , ' bytes/sec)'; cr.
	^ bytesReceived