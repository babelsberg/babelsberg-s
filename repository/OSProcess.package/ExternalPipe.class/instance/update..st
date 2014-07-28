updating
update: aParameter
	"Notify any object waiting for data ready on the pipe."

	self changed.
	self triggerDataReady.
	^ super update: aParameter
