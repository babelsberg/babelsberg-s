*Constraints-Core
collectConstraintsFrom: anObject
	"Backstop. This is never called for effect, but to recoginze that a 
	constraint constction block has completed and its constraints can be collected
	for activation.
	See also:"
	#( send:super:numArgs: 
	" and usage in "
	newProcessConstructing: 
	newProcessConstructing:args:
	).
	^ nil