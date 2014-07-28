examples
showTtyOnTranscript: ttyName
	"Enter lines on /dev/tty, and watch them show up on the Transcript. Normally,
	/dev/tty corresponds to standard input for the Squeak process, so if you have
	a serial port connected to something that generates data, try this example with
	/dev/whatever to demonstrate asych input on a serial port.

	Warning: This method does not set the file stream for nonblocking input, so
	it can block the Squeak VM. The #getAvailableData attempts to work around this,
	but save your image before testing with another serial interfaces."

	"self showTtyOnTranscript: '/dev/tty'"

	| inputStream handler example |
	inputStream := FileStream readOnlyFileNamed: '/dev/tty'.
	handler := AioEventHandler for: inputStream
				exceptions: true
				readEvents: true
				writeEvents: false.
	example := super new handler: handler; ioStream: inputStream.
	handler addDependent: example.
	Transcript cr; show: ''.
	self notify: 'Enter lines on ', ttyName, ', watch the Transcript, and select "Proceed" when done'.
	^ example handler close
