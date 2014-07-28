examples
tcpSocketExample
	"Loosely based on OldSocket>>remoteTestServerTCP. Output is displayed on the Transcript."

	"self tcpSocketExample"

	| port serverTcpSocket serverName clientTcpSocket handler example useOldStyleSockets |
	port := 8086.
	serverName := '127.0.0.1'.

	"The networking code was updated for Squeak 3.6. This checks for which version to use."
	useOldStyleSockets := Socket respondsTo: #initializeNetworkIfFail:.

	Transcript show: 'initializing network ... '.

	useOldStyleSockets
		ifTrue:
			[Socket initializeNetworkIfFail: [^Transcript show:'failed']]
		ifFalse:
			[[Socket initializeNetwork]
				on: Error
				do: [:ex | ^Transcript show:'failed']].
	Transcript show:'ok';cr.

	"Create the server (reader) socket"
	serverTcpSocket := Socket newTCP.
	serverTcpSocket listenOn: port.
	[Transcript show: 'server endpoint created on port ', port asString; cr.
	useOldStyleSockets
		ifTrue:
			[serverTcpSocket waitForConnectionUntil: Socket standardDeadline]
		ifFalse:
			[serverTcpSocket waitForConnectionFor: 10]] fork.
	(Delay forMilliseconds: 1000) wait.

	"Create the client (writer) socket"
	clientTcpSocket := Socket newTCP.
	clientTcpSocket connectTo: (NetNameResolver addressFromString: serverName) port: port.
	useOldStyleSockets
		ifTrue:
			[clientTcpSocket waitForConnectionUntil: Socket standardDeadline]
		ifFalse:
			[clientTcpSocket waitForConnectionFor: 10].
	Transcript show: 'client endpoint connected to ', serverName, ' port ', port asString; cr.

	"Set up a read event handler on the server socket"
	handler := AioEventHandler for: serverTcpSocket
				exceptions: true
				readEvents: true
				writeEvents: false.
	example := super new handler: handler; ioStream: serverTcpSocket.
	handler addDependent: example.
	Transcript show: 'event handler started'; cr.

	"Send a few lines of data to the client socket, waiting briefly between lines.
	The event handler will watch the server socket, and copy data to the Transcript
	each time a new line of data is available to the server."
	(1 to: 10) do:
		[:i |
		clientTcpSocket sendData: 'this is line ', i asString, Character cr asString.
		(Delay forMilliseconds: 500) wait].

	clientTcpSocket closeAndDestroy.
	Transcript show: 'client endpoint closed'; cr.
	serverTcpSocket closeAndDestroy.
	Transcript show: 'server endpoint closed'; cr.
	example close.
	Transcript show: 'event handler stopped'; cr.
	^ Array with: example with: serverTcpSocket with: clientTcpSocket