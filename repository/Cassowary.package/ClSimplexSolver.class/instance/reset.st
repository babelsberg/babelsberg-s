manipulating
reset
	"Re-initialize this solver from the original constraints, thus getting rid of any accumulated numerical problems.  (Actually, I haven't observed any such problems yet, but here's the method anyway)"
	| edits stays others |

	edits := Array new: self editPlusErrorVars size.
	stays := OrderedCollection new.
	others := OrderedCollection new.
	self markerVars keysAndValuesDo: [:cn :v | | i | 
		cn isEditConstraint
			ifTrue: [
				"put the edit constraint in the same place in 'edits' as it is in the current
				  array of edit error vars"
				i := self editPlusErrorVars 
									indexOf: v ifAbsent: [self editMinusErrorVars indexOf: v ].
				edits at: i put: cn]
			ifFalse: [
				cn isStayConstraint ifTrue: [stays add: cn] ifFalse: [others add: cn]]].
	self initialize.
	"add the stays first so that variables keep their old values"
	stays do: [:cn | self addConstraint: cn].

	"add the edits in the same order they were in originally"
	edits do: [:cn | self addConstraint: cn].
	others do: [:cn | self addConstraint: cn]