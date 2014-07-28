instance creation
newWith: anObject name: nameString
	"Create a new variable with anObject as its initial value and name nameString."

	^ self new
		value: anObject;
		name: nameString;
		yourself