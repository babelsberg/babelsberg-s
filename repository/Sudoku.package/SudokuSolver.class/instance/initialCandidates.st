initialize-release
initialCandidates
	| allCandidates file numberList numbers candidates |

	numberList := OrderedCollection new.
	file := MultiByteFileStream fileNamed: fileName.
	file upToEnd asString substrings
		collect: [:row | row do: [:digit | numberList add: digit digitValue]].

	numbers := Matrix new: 9 tabulate: [:i :j | numberList at: (j \\ 10 + (i-1*9))].
	file close.
	
	allCandidates := OrderedCollection new.
	1 to: 9 do:
		[:i | allCandidates add: i].
	
	candidates := Matrix new: 9.
	1 to: 9 do:
		[:i | 1 to: 9 do:
			[:j | ((numbers at: i at: j) = 0)
					ifTrue: [candidates at: i at: j put: allCandidates copy]
					ifFalse: [candidates at: i at: j put: (OrderedCollection with: (numbers at: i at: j))]]].
	^ candidates