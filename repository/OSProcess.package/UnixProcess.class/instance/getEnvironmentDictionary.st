private
getEnvironmentDictionary
	"Answer an environment dictionary using an OSProcessAccessor."

	| index str key val env |
	env := Dictionary new.
	index := 1.
	[(str := processAccessor primEnvironmentAt: index) notNil] whileTrue: [
		key := (str copyUpTo: $=) asSymbol.
		val := (str copyFrom: ((str indexOf: $=) + 1) to: (str size)).
		env at: key put: val.
		index := index + 1].
	^ env


