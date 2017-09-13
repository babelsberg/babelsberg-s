*Constraints-Core
pushReceiverVariable: offset 
	"Simulate the action of bytecode that pushes the contents of the receiver's 
	instance variable whose index is the argument, offset, on the top of the 
	stack."
	<layer: #ccm>
	| variable |
	variable := self receiver instVarAt: offset + 1.
	(self receiver class category =  #'Constraints-Core')
		ifTrue: [self push: variable]
		ifFalse: [
			variable class caseOf: {
				[Array] -> [
					(self receiver isCollection and: [self receiver isSequenceable not])
						ifTrue: ["Do not replace an array of a non-sequenceable collection, e.g. HashedCollection" 
								self push: variable]
						ifFalse: [ | newArray |
							newArray := ConstraintArray withAll: variable.
							self receiver instVarAt: offset + 1 put: newArray.
							"Transcript show: 'replaced directly accessed array with name: ', (self receiver class instVarNameForIndex: offset + 1), ' receiver ', self receiver class; cr."
							self push: newArray]].
				[OrderedCollection] -> [ | oldArray newArray |
					"Transcript show: 'replaced array inside a directly accessed orderedCollection'; cr."
					oldArray := variable instVarAt: 1.
					newArray := ConstraintArray withAll: oldArray.
					variable instVarAt: 1 put: newArray.
					self push: variable].
			} otherwise: [self push: variable]].