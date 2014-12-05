*Constraints
allDifferent
	1 to: self size do: [:idx |
		idx + 1 to: self size do: [:nextIdx |
			((self at: idx) = (self at: nextIdx)) ifTrue: [^ false]]].
	^ true