private
needsRefresh
	"Answer true if the sessionID variable is out of date with respect to the running OS Process."

	^ ((sessionID ~= (self processAccessor primGetSession)) | (pid ~= (self processAccessor primGetPid)))
