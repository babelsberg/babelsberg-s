instance creation
newWith: anObject
	"Create a new variable with anObject as its initial value."

	^ self new
		value: anObject;
		yourself