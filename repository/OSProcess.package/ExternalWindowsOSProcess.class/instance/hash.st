comparing
hash

	^ (pid ifNil: [self identityHash]) + (ppid ifNil: [self identityHash])
