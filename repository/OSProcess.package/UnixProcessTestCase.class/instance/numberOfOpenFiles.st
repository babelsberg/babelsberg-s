private
numberOfOpenFiles
	"Answer the number of files currently open for this OS process. This works
	only on a system with a /proc filesystem and file descriptors located in a
	directory called /proc/<pid>/fd. On other systems, just answer 0."

	"UnixProcessTestCase new numberOfOpenFiles"

	| path |
	path := '/proc/' , OSProcess thisOSProcess pid printString, '/fd'.
	^ (OSProcess directoryExists: path)
		ifTrue: [(OSProcess directoryEntryNames: path) size]
		ifFalse: [0]
