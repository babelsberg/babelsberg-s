accessing
type: aType

	"change the variable type, if the new one is incompatible"
	(self type == #'Bool' and: [aType ~~ #'Bool'])
		ifTrue: [varValue := 1.0].
	(self type ~~ #'Bool' and: [aType == #'Bool'])
		ifTrue: [varValue := true].
	type := aType.