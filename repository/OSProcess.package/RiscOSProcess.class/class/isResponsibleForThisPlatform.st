platform identification
isResponsibleForThisPlatform
	"Answer true if this class is responsible for representing the OS process for
	the Squeak VM running on the current platform."

	^ self isRiscOS
