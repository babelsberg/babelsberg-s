testing - platform specific
isValidUnlockResult: result
	"With no lock cache, the unlock requests will succeed even though there
	is no lock to be removed."	

	^ result isKindOf: OSFileLock
