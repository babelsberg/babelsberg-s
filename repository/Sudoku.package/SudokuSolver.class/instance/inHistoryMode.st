calculation
inHistoryMode 
	"test whether historyPosition is in bounds so that we can use candidatesHistory"
	(historyPosition == 0)
		ifTrue: [^false].
	(historyPosition >= candidatesHistory size)
		ifTrue: [historyPosition := 0. "stop history mode"
				^false].
	^true