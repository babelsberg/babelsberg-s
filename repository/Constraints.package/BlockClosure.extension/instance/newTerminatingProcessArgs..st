*Constraints
newTerminatingProcessArgs: anArray
	"Answer a Process running the code in the receiver. The process is not 
	scheduled."
	<primitive: 19> "Simulation guard"
	^Process
		forContext: 
			[self terminateProcess: (self valueWithArguments: anArray)] asContext
		priority: Processor activePriority