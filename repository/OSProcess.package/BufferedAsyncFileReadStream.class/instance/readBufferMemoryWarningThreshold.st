defaults
readBufferMemoryWarningThreshold
	"A read buffer larger that this may start causing problems. Issue a warning
	before the object memory becomes too large." 

	^self maxReadBufferSize * 1000
