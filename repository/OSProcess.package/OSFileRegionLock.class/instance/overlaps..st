comparing
overlaps: aFileLock
	"Call #overlapsRegion: on aFileLock since we know we're a region but we don't know whether aFileLock is"
	
	^ aFileLock overlapsRegion: self