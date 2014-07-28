testing
testSuspendAioForSocketReadableEvent

	| port serverName serverTcpSocket clientTcpSocket sema semaIndex socketHandle eventHandler receivedData |
	port := 8086.
	serverName := '127.0.0.1'.
	Socket initializeNetwork.

	"Create the server (reader) socket"
	serverTcpSocket := Socket newTCP.
	serverTcpSocket listenOn: port.

	"Create the client (writer) socket"
	clientTcpSocket := Socket newTCP.
	clientTcpSocket connectTo: (NetNameResolver addressFromString: serverName) port: port.

	"Establish socket connection"
	[serverTcpSocket waitForConnectionFor: 10] fork.
	clientTcpSocket waitForConnectionFor: 10.

	["Set up a read event handler on the server socket"
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
		exceptionEvents: false
		readEvents: true
		writeEvents: false.

	self deny: sema isSignaled.

	"Handler generates a signal"
	clientTcpSocket sendData: 'some data to send to the socket'.
	(Delay forMilliseconds: 200) wait.
	receivedData := serverTcpSocket receiveAvailableData.
	self assert: 'some data to send to the socket' = receivedData.
	self assert: sema isSignaled.
	sema wait.
	self deny: sema isSignaled.

	"Handler has not been reset, so no signal this time"
	clientTcpSocket sendData: 'some data to send to the socket'.
	(Delay forMilliseconds: 200) wait.
	receivedData := serverTcpSocket receiveAvailableData.
	self assert: 'some data to send to the socket' = receivedData.
	self deny: sema isSignaled.

	"Reset the handler"
	eventHandler
		aioHandle: socketHandle
		exceptionEvents: false
		readEvents: true
		writeEvents: false.

	"Handler generates a signal"
	clientTcpSocket sendData: 'some data to send to the socket'.
	(Delay forMilliseconds: 200) wait.
	receivedData := serverTcpSocket receiveAvailableData.
	self assert: 'some data to send to the socket' = receivedData.
	self assert: sema isSignaled.
	sema wait.
	self deny: sema isSignaled.

	"Reset the handler"
	eventHandler
		aioHandle: socketHandle
		exceptionEvents: false
		readEvents: true
		writeEvents: false.
	"But temporarily disable it"
	eventHandler aioSuspend: socketHandle
		exceptionEvents: false
		readEvents: true
		writeEvents: false.

	"Handler suspended, so no signal this time"
	clientTcpSocket sendData: 'some data to send to the socket'.
	(Delay forMilliseconds: 200) wait.
	receivedData := serverTcpSocket receiveAvailableData.
	self assert: 'some data to send to the socket' = receivedData.
	self deny: sema isSignaled.

	"Reset the handler"
	eventHandler
		aioHandle: socketHandle
		exceptionEvents: false
		readEvents: true
		writeEvents: false.

	"Handler generates a signal"
	clientTcpSocket sendData: 'some data to send to the socket'.
	(Delay forMilliseconds: 200) wait.
	receivedData := serverTcpSocket receiveAvailableData.
	self assert: 'some data to send to the socket' = receivedData.
	self assert: sema isSignaled.
	sema wait.
	self deny: sema isSignaled.

	clientTcpSocket close.
	serverTcpSocket close]
		ensure:
			[Smalltalk unregisterExternalObject: sema.
			(socketHandle isKindOf: Integer) ifTrue: [eventHandler aioDisable: socketHandle]]