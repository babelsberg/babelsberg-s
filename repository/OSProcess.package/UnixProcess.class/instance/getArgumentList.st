private
getArgumentList
	"Answer the argument list using anOSProcessAccessor. For Unix, the first element of the list
	would be the program name. This element will not be treated as an argument; rather, it is
	stored as the programName instance variable."

	| index val list |
	list := OrderedCollection new.
	index := 2.
	[(val := processAccessor primArgumentAt: index) notNil] whileTrue: [
		list add: val.
		index := index + 1].
	^ list asArray

