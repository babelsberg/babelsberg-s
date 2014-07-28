solving
checkStrategyForRows
"It is a really tough strategy! :-)"
"This method search for thre connected field that has two possibilities with three different numbers. Each number should be placed in one of exactly two possible cells."
	inputMatrix withIndicesDo: [:candidateList :x :y | 
		candidateList size = 2 ifTrue: [ | possibleCellsRow possibleCellsBox possibleCellsColumn |
				possibleCellsRow := (inputMatrix atRow: x) 
					select: [:each | each size = 2 and: [(each difference: candidateList) size = 1]].
				possibleCellsBox := (inputMatrix atBox: (SudokuGrid boxNumberFromIndex: x@y)) 
					select: [:each | each size = 2 and: [(each difference: candidateList) size = 1]].   
				possibleCellsColumn := (inputMatrix atColumn: y) 
					select: [:each | each size = 2 and: [(each difference: candidateList) size = 1]].
				
				possibleCellsRow do: [:candidatesListRow | | sameNumber missingNumbers |
					sameNumber := (candidatesListRow intersection: candidateList) first.
					missingNumbers := (candidateList reject: [:number | number = sameNumber]) union: (candidatesListRow reject: [:number | number = sameNumber]).
					(possibleCellsBox select: [:each | each includesAllOf: missingNumbers])
						ifNotEmpty: ["All cells in the row of the box cell that lay in the box of the current cell (with candidatesListRow) and the cells in the current box that lay in the row of the row cell."
							| removeNumber currentColumn boxCell boxNumber boxIndex columns1 columns2 |
							removeNumber := (missingNumbers difference: candidateList) anyOne.
							currentColumn := (inputMatrix atRow: x) indexOf: candidatesListRow.    
							boxCell := (possibleCellsBox select: [:each | each includesAllOf: missingNumbers]) first.
							boxNumber := SudokuGrid boxNumberFromIndex: x@y.
							boxIndex := SudokuGrid indexOfbox: boxNumber cell: ((inputMatrix atBox: boxNumber) indexOf: boxCell).
							(boxIndex x = x) ifFalse: [  
								"Remove candidates in current box"
								columns1 := SudokuGrid missingLineNumbersInBoxForLine: y.
								columns1 do: [:each |
									((candidates at: x at: each) includes: removeNumber) ifTrue: [
												solvedCells := true. 
												(highlightCandidates at: x at: currentColumn) addAll: candidatesListRow.
												(highlightCandidates at: boxIndex x at: boxIndex y) addAll: missingNumbers.
												(highlightCandidates at: x at: y) addAll: candidateList.
												(candidates at: x at: each) remove: removeNumber]].
									
								"Remove candidates in the box of the row cell"
								columns2 := SudokuGrid missingLineNumbersInBoxForLine: currentColumn.
								columns2 add: currentColumn.
								columns2 do: [:each |
									((candidates at: boxIndex x at: each) includes: removeNumber) ifTrue: [
												solvedCells := true. 
												(highlightCandidates at: x at: currentColumn) addAll: candidatesListRow.
												(highlightCandidates at: boxIndex x at: boxIndex y) addAll: missingNumbers.
												(highlightCandidates at: x at: y) addAll: candidateList.
												(candidates at: boxIndex x at: each) remove: removeNumber]]]]
								
						ifEmpty: [(possibleCellsColumn select: [:each | each includesAllOf: missingNumbers])
									ifNotEmpty: ["One possible cell to remove a candidate" | removeNumber row column |
										removeNumber := (missingNumbers difference: candidateList) anyOne.
										column := (inputMatrix atRow: x) indexOf: candidatesListRow.
										row := (inputMatrix atColumn: y) indexOf: (possibleCellsColumn select: [:each | each includesAllOf: missingNumbers]) first.
										((candidates at: row at: column) includes: removeNumber) ifTrue: [
											solvedCells := true. 
											(highlightCandidates at: x at: column) addAll: candidatesListRow.
											(highlightCandidates at: row at: y) addAll: missingNumbers.
											(highlightCandidates at: x at: y) addAll: candidateList.
											(candidates at: row at: column) remove: removeNumber]]]].
							
				possibleCellsRow ifEmpty: [
					possibleCellsColumn do: [:candidateListColumn | | sameNumber missingNumbers |
						sameNumber := (candidateListColumn intersection: candidateList) first.
						missingNumbers := (candidateList reject: [:number | number = sameNumber]) union: (candidateListColumn reject: [:number | number = sameNumber]).
						(possibleCellsBox select: [:each | each includesAllOf: missingNumbers])
							ifNotEmpty: ["All cells in the column of the box cell that lay in the box of the current cell (with candidateListColumn) and the cells in the current box that lay in the column of the column cell."
								| removeNumber row boxIndex rows2 rows1 boxCell boxNumber |
								removeNumber := (missingNumbers difference: candidateList) anyOne.
								boxCell := (possibleCellsBox select: [:each | each includesAllOf: missingNumbers]) first.
								boxNumber := SudokuGrid boxNumberFromIndex: x@y.
								boxIndex := SudokuGrid indexOfbox: boxNumber cell: ((inputMatrix atBox: boxNumber) indexOf: boxCell).
								row := (inputMatrix atColumn: y) indexOf: candidateListColumn. 
								
								(boxIndex y = y) ifFalse: [   
									"Remove candidates in the box of the cell"
									rows1 := SudokuGrid missingLineNumbersInBoxForLine: row.
									rows1 add: row.
									rows1 do: [:each |								  
										((candidates at: each at: boxIndex y) includes: removeNumber) ifTrue: [
												solvedCells := true. 
												(highlightCandidates at: row at: y) addAll: candidateListColumn.
												(highlightCandidates at: boxIndex x at: boxIndex y) addAll: missingNumbers.
												(highlightCandidates at: x at: y) addAll: candidateList.
												(candidates at: each at: boxIndex y) remove: removeNumber]].
										
									"Remove candidates in current box"		
									rows2 := SudokuGrid missingLineNumbersInBoxForLine: x.
									rows2 do: [:each |
										((candidates at: each at: y) includes: removeNumber) ifTrue: [
												solvedCells := true. 
												(highlightCandidates at: row at: y) addAll: candidateListColumn.
												(highlightCandidates at: boxIndex x at: boxIndex y) addAll: missingNumbers.
												(highlightCandidates at: x at: y) addAll: candidateList.
												(candidates at: each at: y) remove: removeNumber]]]]]]
			].
		 ]  