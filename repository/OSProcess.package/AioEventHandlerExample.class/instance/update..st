updating
update: anObject

	(anObject isKindOf: AioEventHandler)
		ifTrue: [Transcript show: self getAvailableData]
