read event handling
disableEventHandling

	eventHandler
		ifNotNil: [eventHandler removeDependent: self; close].
	self eventHandler: nil