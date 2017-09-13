Accessing
testSelectors
	"There's an old VM that may cause havoc in the PNG decoder and
	we can do nothing about it. So do not bother testing those at all."

	| selectors |
	selectors := super testSelectors.
	^ (Smalltalk vm isHeadless and: [Smalltalk vm platformSourceVersion substrings second =  'r3427'])
		ifFalse: [selectors]
		ifTrue: [selectors copyWithoutAll: #(
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