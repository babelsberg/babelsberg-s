comparing
hash

	^ (pid ifNil: [self identityHash])
		+ (sessionID
				ifNil: [0]
				ifNotNil: [sessionID sum])