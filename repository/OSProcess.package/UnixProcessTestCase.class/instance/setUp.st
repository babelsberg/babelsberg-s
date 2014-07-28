running
setUp

	(self respondsTo: #timeout: ) "Recent Squeak images with test case timeout"
		ifTrue: [self perform: #timeout: with: 60].
	thisOSProcess := OSProcess thisOSProcess
