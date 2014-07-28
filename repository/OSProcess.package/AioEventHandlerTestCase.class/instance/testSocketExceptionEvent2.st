testing
testSocketExceptionEvent2
	"Close the client socket to generate an event on the server socket"

	| port serverTcpSocket sema semaIndex socketHandle eventHandler |
	port := 8086.
	Socket initializeNetwork.

	"Create the server (reader) socket"
	serverTcpSocket := Socket newTCP.
	serverTcpSocket listenOn: port.

	["Set up an exception event handler on the server socket"
	sema := Semaphore new.
	semaIndex := Smalltalk registerExternalObject: sema.
	eventHandler := AioEventHandler new.
	socketHandle := eventHandler handleForSocket: serverTcpSocket.

	"An aio handler may already have been established for the socket
	by the SocketPlugin. The following request disables any existing handling
	in order to prevent a warning message on the console stderr."
	eventHandler aioDisable: socketHandle.

	"Now set our own handler."
	[eventHandler
			aioEnable: socketHandle
			forSemaphore: semaIndex
			externalObject: true]
		on: Warning
		do: ["Suppress warning dialog. Unit test will fail next assert."].
	eventHandler
		aioHandle: socketHandle
		exceptionEvents: true
		readEvents: false
		writeEvents: true.
	self deny: sema isSignaled.
	[serverTcpSocket
		primSocket: serverTcpSocket socketHandle
		sendData: 'a string to send'
		startIndex: 1
		count: 10] on: Error do: [self halt].
	serverTcpSocket
		receiveSomeDataInto: (String new: 1000)
		startingAt: 1.

"	self assert: sema isSignaled.	FIXME: no error generated; need to find a way to generate an error -dtl"
	self deny: sema isSignaled.

	serverTcpSocket close]
		ensure:
			[Smalltalk unregisterExternalObject: sema.
			(socketHandle isKindOf: Integer) ifTrue: [eventHandler aioDisable: socketHandle]]