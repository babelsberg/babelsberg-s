read event handling
hasValidHandler

	^ self eventHandler notNil and: [eventHandler hasValidHandler]
