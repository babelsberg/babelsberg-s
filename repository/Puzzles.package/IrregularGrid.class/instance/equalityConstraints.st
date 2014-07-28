accessing
equalityConstraints 

	equalityConstraints ifNil: [equalityConstraints := Matrix new: self rowCount].
	^ equalityConstraints