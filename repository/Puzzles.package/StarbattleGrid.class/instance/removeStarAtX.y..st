solving
removeStarAtX: x y: y

	(self equalityConstraints at: x at: y) ifNil: [Transcript show: 
		'WARNING - Cannot remove a star at (', x, ',', y, '), because there is no star.'; cr.
		^ self].
	(self equalityConstraints at: x at: y) disable.
	self equalityConstraints at: x at: y put: nil.