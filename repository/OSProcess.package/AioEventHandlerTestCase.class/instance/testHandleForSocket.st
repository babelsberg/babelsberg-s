testing
testHandleForSocket

	| eventHandler socket socketHandle |
	eventHandler := AioEventHandler new.
	socket := Socket newTCP.
	socketHandle := eventHandler handleForSocket: socket.
	self assert: socketHandle notNil.
	self assert: (socketHandle isKindOf: Integer).
	self assert: (socketHandle ~= 0) "0 is stdin on unix, unlikely to be used on other platforms"
