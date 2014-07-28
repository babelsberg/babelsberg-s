private
argsAsFlatArrayAndOffsets: anArrayOfNullTerminatedStrings
	"Given anArrayOfNullTerminatedStrings, flatten the array into a string buffer,
	leaving space at the beginning of the buffer for a list of C pointers. Answer
	the string buffer and an array of address offsets. The address offsets may later
	be converted to C pointers and overlaid on the beginning of the buffer, resulting
	in a data structure which can be treated as a C array of strings suitable for
	use as a Unix argv vector."

	"OSProcess thisOSProcess argsAsFlatArrayAndOffsets:
		(UnixProcess arguments collect:
			[:e | e, (Character value: 0) asString])"

	| offset arraySize flatStringArray ws addresses |
	"Preserve offset space to hold address pointers."
	offset := (anArrayOfNullTerminatedStrings size + 1) * self processAccessor sizeOfPointer.
	"Allocate flat strings buffer"
	arraySize := (anArrayOfNullTerminatedStrings collect: [:e | e size]) sum
		+ ((anArrayOfNullTerminatedStrings size + 1) * self processAccessor sizeOfPointer).
	"Flatten the strings out into a buffer, leaving room at the
	beginning of the buffer for an array of addresses."
	flatStringArray := String new: arraySize.
	ws := WriteStream on: flatStringArray.
	offset timesRepeat: [ws nextPut: (Character value: 0)].
	anArrayOfNullTerminatedStrings do: [:e | ws nextPutAll: e].
	"Find address offsets to be used in creating the addresses for the strings."
	ws := WriteStream on: (Array new: anArrayOfNullTerminatedStrings size).
	(anArrayOfNullTerminatedStrings collect: [:e | e size])
		inject: offset into: [:p :e | ws nextPut: p. p + e].
	addresses := ws contents.
	"Results"
	^ Array with: flatStringArray with: addresses
