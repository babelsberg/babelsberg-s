event handling
mouseDown: evt
	"left-click -> red,"
	imageMorph visible 
		ifTrue: [self sudokuModel removeStarAtX: self xCoord y: self yCoord.
				imageMorph hide]
		ifFalse: [
			evt redButtonPressed 
				ifTrue: [[self sudokuModel suggestStarAtX: self xCoord y: self yCoord] 
					ifError: [self inform: 'A star at this position made the Starbattle unsatisfiable.'. ^ self].
					imageMorph image: starForm]
				ifFalse: [imageMorph image: minusForm]. 
			imageMorph show].