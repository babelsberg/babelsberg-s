stepping and presenter
playOrPause

	state 
		ifTrue: [self stopStepping.
				self labelGraphic: playForm]
		ifFalse: [self startStepping.
				self labelGraphic: pauseForm].
	state := state not.