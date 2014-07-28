private
getProgramName
	"Answer the name of the program which is being run by this OS process. Assume the
	Unix convention where the first element of (char **)argv is the program name."

	^ programName := processAccessor primArgumentAt: 1
