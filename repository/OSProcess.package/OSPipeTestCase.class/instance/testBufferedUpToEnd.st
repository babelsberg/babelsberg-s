testing
testBufferedUpToEnd

	"(OSPipeTestCase selector: #testBufferedUpToEnd) debug"

	| s p r1 r2 |
	s := 'some data to put through the pipe'.
	p := OSPipe new.
	self primTestEndOfFileFlag: p reader fileID. "check that OSPP is updated"
	self assert: p setBufferedReader.
	[p nextPutAll: s.
	p closeWriter.
	r1 := p upToEnd. "#atEnd does not detect EOF on a pipe"
	self assert: r1 isEmpty.
	r2 := p upToEndOfFile. "detects EOF correctly, gets remaining data"
	self assert: r2 = s]
		ensure: [p close]
