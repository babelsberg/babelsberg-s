private
envAsFlatArrayAndOffsets: anEnvironmentDictionary
	"Given anEnvironmentDictionary, flatten the dictionary into a string buffer,
	leaving space at the beginning of the buffer for a list of C pointers. Answer
	the string buffer and an array of address offsets. The address offsets may later
	be converted to C pointers and overlaid on the beginning of the buffer, resulting
	in a data structure which can be treated as a C array of strings suitable for
	use as a Unix process environment."

	"OSProcess thisOSProcess envAsFlatArrayAndOffsets: UnixProcess env"

	| offset envArray arraySize flatStringArray ws addresses |
	"Preserve offset space to hold address pointers."
	offset := (anEnvironmentDictionary size + 1) * self processAccessor sizeOfPointer.
	"Build collection of environment strings"
	envArray := OrderedCollection new.
	anEnvironmentDictionary keysAndValuesDo: [:k :v | envArray add: (k, '=', v)].
	"Allocate flat strings buffer"
	arraySize := ((envArray collect: [:e | e size + 1]) sum) + offset.
	"Flatten the strings out into a buffer, leaving room at the beginning of
	the buffer for an array of addresses."
	flatStringArray := String new: arraySize.
	ws := WriteStream on: flatStringArray.
	offset timesRepeat: [ws nextPut: (Character value: 0)].
	envArray do: [:e | ws nextPutAll: e; nextPut: (Character value: 0)].
	"Find address offsets to be used in creating the addresses for the strings."
	ws := WriteStream on: (Array new: anEnvironmentDictionary size).
	(envArray collect: [:e | e size + 1])
		inject: offset into: [:p :e | ws nextPut: p. p + e].
	addresses := ws contents.
	"Results"
	^ Array with: flatStringArray with: addresses
