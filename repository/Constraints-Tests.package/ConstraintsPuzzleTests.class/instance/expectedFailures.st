testing
expectedFailures
	
	"There's an old VM that may cause havoc in the PNG decoder and
	we can do nothing about it."
	^ (Smalltalk vm isHeadless and: [Smalltalk vm platformSourceVersion substrings second =  'r3427'])
		ifFalse: [super expectedFailures]
		ifTrue: [#(
			#testNoneSatisfyNeighborCount
			#testStarbattleCollectStars
			#testStarbattleGridColumnCount
			#testStarbattleGridNoTouch
			#testStarbattleGridNoTouch2
			#testStarbattleGridRegionCount
			#testStarbattleGridRowCount
			#testStarbattleNeighborCount
			#testStarbattleSelectStar
			#testStarbattleSelectStar2
		)]