utility
systemAttributes
	"Answer a Dictionary of all of the system attributes which can be obtained from
	SystemDictionary>>getSystemAttribute."

	"OSProcess systemAttributes"

	| args idx a |
	args := Dictionary new.

	idx := -1.
	[a := self getSystemAttribute: idx.
	a notNil and: [a size > 0]]
		whileTrue: [args at: idx put: a. idx := idx - 1].

	a := self getSystemAttribute: 0.
	(a notNil and: [a size > 0]) ifTrue: [args at: 0 put: a. idx := idx - 1].
	a := self getSystemAttribute: 1.
	(a notNil and: [a size > 0]) ifTrue: [args at: 1 put: a. idx := idx - 1].
	a := self getSystemAttribute: 2.
	(a notNil and: [a size > 0]) ifTrue: [args at: 2 put: a. idx := idx - 1].

	idx := 2.
	[a := self getSystemAttribute: idx.
	a notNil and: [a size > 0]]
		whileTrue: [args at: idx put: a. idx := idx + 1].

	idx := 1001.
	[a := self getSystemAttribute: idx.
	a notNil and: [a size > 0]]
		whileTrue: [args at: idx put: a. idx := idx + 1].

	^ args.

