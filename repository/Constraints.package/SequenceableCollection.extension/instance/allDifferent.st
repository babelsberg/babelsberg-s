*Constraints-testing
allDifferent

	self withIndexDo: [:each :idx |
		idx + 1 to: self size do: [:nextIdx |
			each = (self at: nextIdx) ifTrue: [^false]]].
	^ true