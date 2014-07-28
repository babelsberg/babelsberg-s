solving
searchForPairs: aCollection
"This method returns a collection of all pairs in aCollection. A pair is found if two lists have the same candidates."
	| possiblePairs pairs |
	pairs := OrderedCollection new.
	possiblePairs := OrderedCollection new.
	aCollection do:
		[:candidates | |foundPair|
					foundPair := false.
					possiblePairs do:
						[:pair | (pair includesAllOf: candidates) 
									ifTrue: [pairs add: candidates. foundPair := true]].
					foundPair ifFalse: [possiblePairs add: candidates]].
	^ pairs