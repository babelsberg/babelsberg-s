private
pathString
	"Answer the path string from the environment. Assume Unix convention in which the
	path name is a colon delimited string stored in the PATH environment variable."

	^ self environment at: #PATH ifAbsent: [nil]