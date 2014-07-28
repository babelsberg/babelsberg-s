accessing
missingLineNumbersInBoxForLine: lineNumber
	| dict |
	dict := Dictionary new.
	dict 
		add: 1 -> (OrderedCollection with: 2 with: 3);
		add: 2 -> (OrderedCollection with: 1 with: 3);
		add: 3 -> (OrderedCollection with: 1 with: 2);
		add: 4 -> (OrderedCollection with: 5 with: 6);
		add: 5 -> (OrderedCollection with: 4 with: 6);
		add: 6 -> (OrderedCollection with: 4 with: 5);
		add: 7 -> (OrderedCollection with: 8 with: 9);
		add: 8 -> (OrderedCollection with: 7 with: 9);
		add: 9 -> (OrderedCollection with: 7 with: 8).
	^ dict at: lineNumber