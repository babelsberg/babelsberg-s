read ahead buffer
moveAvailableDataToBuffer

	^ self moveAvailableDataFrom: (OSProcess accessor handleFromAccessor: self ioHandle).
