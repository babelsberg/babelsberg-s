testing - C string arrays
testEnvAsFlatArrayAndOffsets
	"Test conversion of a dictionary of key-value environment variables into the
	form used to create a C **char in UnixOSProcessPlugin."

	"(UnixProcessAccessorTestCase selector: #testEnvAsFlatArrayAndOffsets) debug"

	| pointerSize lengthOfCStrings totalLength stringsAndOffsets rs s arrayWithMachineDependentPointers d |
	pointerSize := OSProcess accessor sizeOfPointer.
	d := Dictionary new.
	d at: #ONE put: 'one'.
	d at: #TWO put: 'two'.
	d at: #THREE put: 'three'.
	stringsAndOffsets := OSProcess thisOSProcess envAsFlatArrayAndOffsets: d.
	self assert: stringsAndOffsets size == 2.
	self assert: stringsAndOffsets second size == 3.

	lengthOfCStrings := d keys
		inject: 0
		into: [:sum :e | sum + e size + '=' size + (d at: e) size + (String new: 1) size].

	totalLength := 4 * pointerSize + lengthOfCStrings.
	self assert: stringsAndOffsets first size == totalLength.
	stringsAndOffsets second do: [:offset |
		(stringsAndOffsets first at: offset) == (Character value: 0)].

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
