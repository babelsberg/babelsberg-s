instance creation
newWithSymbolicWeight
	| newGuy |

	newGuy := self new.
	newGuy constant: ClSymbolicWeight zero.
	^ newGuy