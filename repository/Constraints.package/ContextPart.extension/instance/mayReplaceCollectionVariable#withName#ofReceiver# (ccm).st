*Constraints
mayReplaceCollectionVariable: aCollection withName: aName ofReceiver: aReceiver
	"If aCollection is an Array or an OrderedCollection, replace the array with a ConstraintArray, otherwise return aCollection."
	<layer: #ccm>
	(aCollection class category =  #'Constraints-Core')
		ifTrue: [^ aCollection]
		ifFalse: [
			aCollection class caseOf: {
				[Array] -> [	| newArray |
					(aReceiver isCollection and: [aReceiver isSequenceable not])
						ifTrue: ["Do not replace an array of a non-sequenceable collection, e.g. HashedCollection" 
								^ aCollection].
					newArray := ConstraintArray withAll: aCollection.
					aReceiver instVarNamed: aName put: newArray.
					"Transcript show: 'replaced array instance variable with name: ', aName; cr."
					^ newArray].
				[OrderedCollection] -> [ | oldArray newArray |
					oldArray := aCollection instVarAt: 1.
					newArray := ConstraintArray withAll: oldArray.
					aCollection instVarAt: 1 put: newArray.
					"Transcript show: 'replaced array inside an instance variable of type OrderedCollection'; cr."
					^ aCollection].
			} otherwise: [^ aCollection]].