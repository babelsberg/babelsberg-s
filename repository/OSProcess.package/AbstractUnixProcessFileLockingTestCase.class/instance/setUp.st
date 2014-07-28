running
setUp

	(self respondsTo: #timeout: ) "Recent Squeak images with test case timeout"
		ifTrue: [self perform: #timeout: with: 30].
	self delay: (Delay forMilliseconds: 150).
	self accessor: ThisOSProcess accessor.
	self fileStream: (FileStream fileNamed: 'junkfile').
	1000 timesRepeat: (fileStream nextPutAll: 'hello world ').
