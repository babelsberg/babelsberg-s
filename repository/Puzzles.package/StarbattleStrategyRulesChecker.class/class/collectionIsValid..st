as yet unclassified
collectionIsValid: aCollection
"This method checks the rules in aCollection."
	(aCollection count: [:cell | cell isStar includes: 1]) < 2
		ifTrue: ["The collection cannot contain two stars." ^false].

	(aCollection count: [:cell | cell isStar size = 1 and: [cell isStar first = 1]]) > 2
		ifTrue: ["The collection has more than two stars." ^false].

	^ true