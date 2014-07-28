comparing
overlaps: aFileLock
	"Answer true if the receiver represents an addressable region that overlaps aFileLock"
	
	^ aFileLock fileStream fullName = self fileStream fullName