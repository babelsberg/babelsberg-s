defaults
readAheadChunkSize
	"The async read ahead process will read at most this many characters.
	Notes: On my system (dtl), a chunk size of 2000 leads to ExternalCommandShell
	overdriving the stdout stream when doing (for example) a long directory listing.
	I have added error handling to accommodate this, but I do know know how
	reliable it is, so I would prefer to avoid generating the condition. A chunk
	size of 200 is small enough that performance is noticably impacted in a
	CommandShell window. A chunk size of 1000 seems to produce good overall
	behavior."

	^ 1000