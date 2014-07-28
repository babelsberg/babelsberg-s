testing - class examples
testEightLeafSqueakTree

	"(UnixProcessTestCase selector: #testEightLeafSqueakTree) run"

	| a openFileCount |
	openFileCount := self numberOfOpenFiles.
	self shouldnt: [a := UnixProcess eightLeafSqueakTree]
		raise: Warning.
	self assert: (a isKindOf: Array).
	self assert: a size == 3.
	(a includes: 0)
		ifTrue:
			[Smalltalk quitPrimitive].
	self assert: self numberOfOpenFiles == openFileCount
