*Constraints-Core
newProcessConstructing: aConstraint args: anArray
	"Answer a Process running the code in the receiver. The process is not 
	scheduled."
	<primitive: 19> "Simulation guard"
	^Process
		forContext: 
			[self currentConstraint: aConstraint during: 
				[#ccm withLayerDo:
					[self collectConstraintsFrom: (self valueWithArguments: anArray)]]] asContext
		priority: Processor activePriority