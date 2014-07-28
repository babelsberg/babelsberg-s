instance creation
threadID: anInteger handle: aHandleObject running: trueOrFalse

	| thread |
	thread := super new threadID: anInteger; handle: aHandleObject; initialize.
	trueOrFalse ifTrue: [thread running].
	^ thread
