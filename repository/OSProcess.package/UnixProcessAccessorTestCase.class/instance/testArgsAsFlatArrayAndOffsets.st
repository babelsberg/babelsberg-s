testing - C string arrays
testArgsAsFlatArrayAndOffsets
	"Test conversion of an array of strings into the form used to create a C **char
	in UnixOSProcessPlugin."

	"(UnixProcessAccessorTestCase selector: #testArgsAsFlatArrayAndOffsets) debug"

	| a pointerSize lengthOfCStrings totalLength stringsAndOffsets rs s arrayWithMachineDependentPointers |
	pointerSize := OSProcess accessor sizeOfPointer.
	a := { 'one ' . 'two ' . 'three ' }.
	a do: [:e | e at: e size put: (Character value: 0)].
	stringsAndOffsets := OSProcess thisOSProcess argsAsFlatArrayAndOffsets: a.
	self assert: stringsAndOffsets size == 2.
	self assert: stringsAndOffsets second size == 3.
	lengthOfCStrings := (a collect: [:e | e size]) sum.
	totalLength := 4 * pointerSize + lengthOfCStrings.
	self assert: stringsAndOffsets first size == totalLength.
	stringsAndOffsets second do: [:offset |
		(stringsAndOffsets first at: offset) == (Character value: 0)].

	rs := ReadStream on: stringsAndOffsets first.
	rs next: 4 * pointerSize.
	s :=  rs next: 3.
	rs next.
	self assert: s = 'one'.
	s :=  rs next: 3.
	rs next.
	self assert: s = 'two'.
	s :=  rs next: 5.
	rs next.
	self assert: s = 'three'.

	rs := ReadStream on: stringsAndOffsets first.
	rs next: (stringsAndOffsets second at: 1).
	s :=  rs next: 3.
	self assert: s = 'one'.
	rs := ReadStream on: stringsAndOffsets first.
	rs next: (stringsAndOffsets second at: 2).
	s :=  rs next: 3.
	self assert: s = 'two'.
	rs := ReadStream on: stringsAndOffsets first.
	rs next: (stringsAndOffsets second at: 3).
	s :=  rs next: 5.
	self assert: s = 'three'.

	arrayWithMachineDependentPointers := self
		primFixPointersInArrayOfStrings: stringsAndOffsets first
		withOffsets: stringsAndOffsets second
		count: stringsAndOffsets second size.
	self assert: arrayWithMachineDependentPointers size == stringsAndOffsets first size.
	rs := ReadStream on: arrayWithMachineDependentPointers.
	s := rs next: pointerSize.
	self assert: s ~= (String new: pointerSize). "a C pointer"
	s := rs next: pointerSize.
	self assert: s ~= (String new: pointerSize). "a C pointer"
	s := rs next: pointerSize.
	self assert: s ~= (String new: pointerSize). "a C pointer"
	s := rs next: pointerSize.
	self assert: s = (String new: pointerSize). "a NULL pointer"
	self assert: rs upToEnd = (stringsAndOffsets first allButFirst: pointerSize * 4)
