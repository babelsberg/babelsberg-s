platform identification
isResponsibleForThisPlatform
	"Answer true if, for the current platform, this class is responsible for representing
	an OS process other than that in which the Squeak VM is currently running."

	^ self isRiscOS
