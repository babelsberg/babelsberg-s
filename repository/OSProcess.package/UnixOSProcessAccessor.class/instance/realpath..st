external process access
realpath: pathString
	"Get the real path for pathString from the external OS process."

	"OSProcess accessor realpath: '/tmp'"
	"OSProcess accessor realpath: OSProcess defaultPathString"
	"OSProcess accessor realpath: '/bogus/path/name'"

	^ self primRealpath: pathString
