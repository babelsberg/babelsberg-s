accessing
candidates
	"Answer the value of candidates"

	candidatesHistory 
		ifEmpty: [candidatesHistory add: self initialCandidates].
	historyPosition == 0
		ifFalse: [^ candidatesHistory at: historyPosition].
	^ candidatesHistory last