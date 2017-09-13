accessing
type: aType

	"change the variable type, if the new one is incompatible"
	self type = 'Bool' & (aType ~= 'Bool')
		ifTrue: [varValue := 1.0].
	aType = 'Bool' & (self type ~= 'Bool')
		ifTrue: [varValue := true].
	type := aType.