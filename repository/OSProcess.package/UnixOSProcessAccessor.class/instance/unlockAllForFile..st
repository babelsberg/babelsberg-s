file locking
unlockAllForFile: aFileStream
	"Unlock and uncache all locks associated with aFileStream.  This could be called
	before closing a stream, for example."

	(self registeredLocksForFile: aFileStream) do: [:ea | self unlockFileRegion: ea]
