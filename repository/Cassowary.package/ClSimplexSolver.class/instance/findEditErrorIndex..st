private
findEditErrorIndex: eVars
	"find the index in editPlusErrorVars of one of the variables in eVars"

	eVars do: [:v | | index |
		index := self editPlusErrorVars indexOf: v.
		index > 0 ifTrue: [^ index]].
	ClError internalError signal  "didn't find a variable"