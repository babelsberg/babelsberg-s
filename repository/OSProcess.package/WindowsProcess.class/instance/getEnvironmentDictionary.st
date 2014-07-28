private
getEnvironmentDictionary
	"Answer an environment dictionary using an OSProcessAccessor."

	"OSProcess thisOSProcess getEnvironmentDictionary"

	| strings env |
	strings := processAccessor primGetEnvironmentStrings.
	strings isNil
		ifTrue:
			[^ nil]
		ifFalse:
			[env := Dictionary new.
			strings do: [:s |
				env at: (s copyUpTo: $=) asSymbol put: (s copyAfterLast: $=)].
			^ env]
