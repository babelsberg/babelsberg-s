private
tryUntil: aBlock
	"Repeat until block evaluates true, but do not get in an infinite loop if a primitive is failing"

	| result |
	10 timesRepeat:
		[result := aBlock value.
		result ifTrue: [^ result].
		delay wait].
	^ result
