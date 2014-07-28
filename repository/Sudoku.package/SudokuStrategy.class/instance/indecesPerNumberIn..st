as yet unclassified
indecesPerNumberIn: aCollection
"This method returns a dictionary with all possible numbers as keys. The values are lists of all indices in aCollection, where the number is included. The given collection can be a row of the candidates matrix."
	| dict |
	dict := Dictionary new.
	1 to: aCollection size do: [:number |
		dict at: number put: OrderedCollection new].
	aCollection withIndexDo: [:candidateList :index |
		candidateList do: [:number |
			(dict at: number) add: index]].
	^ dict