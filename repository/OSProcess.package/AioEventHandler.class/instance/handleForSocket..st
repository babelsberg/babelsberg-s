private
handleForSocket: aSocket

	"self new handleForSocket: Socket newTCP"

	| ioHandle |
	ioHandle := self useIOHandle
		ifTrue: [aSocket ioHandle]
		ifFalse: [aSocket socketHandle].
	^ self primOSSocketHandle: ioHandle
