as yet unclassified
isValid: aSudokuGrid
"This method checks the rules in a candidates grid."
	1 to: aSudokuGrid rowCount do:
		[:i |	| row column box | 
			row := (aSudokuGrid atRow: i).
			row detect: [:numberList | numberList isEmpty or: [numberList size = 1 and: [(row select: [:each | numberList includesAllOf: each]) size > 1]]]
				ifFound: [:temp | ^false]
				ifNone: [].
			
			column := aSudokuGrid atColumn: i.
			column detect: [:numberList | numberList isEmpty or: [numberList size = 1 and: [(column select: [:each | numberList includesAllOf: each]) size > 1]]]
				ifFound: [:temp | ^false]
				ifNone: [].
		  	
			box := aSudokuGrid atBox: i.
			box detect: [:numberList | numberList isEmpty or: [numberList size = 1 and: [(box select: [:each | numberList includesAllOf: each]) size > 1]]]
				ifFound: [:temp | ^false]
				ifNone: []].
	^ true