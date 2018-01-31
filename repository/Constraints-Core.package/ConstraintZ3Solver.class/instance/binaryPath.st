accessing
binaryPath

	^ binaryPath ifNil: [binaryPath := self getBinaryPath]