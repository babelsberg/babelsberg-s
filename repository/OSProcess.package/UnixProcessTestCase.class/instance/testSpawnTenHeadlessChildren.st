testing - class examples
testSpawnTenHeadlessChildren

	"(UnixProcessTestCase selector: #testSpawnTenHeadlessChildren) run"

	| a openFileCount |
	openFileCount := self numberOfOpenFiles.
	self shouldnt: [a := UnixProcess spawnTenHeadlessChildren]
		raise: Warning. "Catch warning if fork fails"
	[(a detect: [:p | p isComplete not] ifNone: []) notNil]
		whileTrue: [(Delay forMilliseconds: 100) wait].
	self should: [(a select: [:p | p isComplete not]) isEmpty].
	self assert: self numberOfOpenFiles == openFileCount
