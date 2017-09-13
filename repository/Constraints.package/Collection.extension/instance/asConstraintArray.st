*Constraints-Core
asConstraintArray

	| array index |
	array := ConstraintArray new: self size.
	index := 0.
	self do: [:each | array at: (index := index + 1) put: each].
	^ array