accessing
sessionIdentifier

	^ sessionIdentifier ifNil: [sessionIdentifier := self getSessionIdentifier]
