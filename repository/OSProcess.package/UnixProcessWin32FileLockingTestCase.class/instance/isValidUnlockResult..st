testing - platform specific
isValidUnlockResult: result
	"With a lock cache, the unlock requests will fail when if there
	is no lock to be removed."	

	^ result == nil
