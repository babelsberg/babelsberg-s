initialize
windowIsClosing

	Processor activeProcess environmentRemoveKey: #constraintObject ifAbsent: [].
	super windowIsClosing.