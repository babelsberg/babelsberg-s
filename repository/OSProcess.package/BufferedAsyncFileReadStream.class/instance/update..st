updating
update: aParameter
	"A #changed event is generated as a side effect of this method"

	(aParameter == self eventHandler)
		ifTrue: [self moveAvailableDataToBuffer]
