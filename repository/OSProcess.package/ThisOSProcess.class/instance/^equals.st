comparing
= processProxy
	"True if this is a proxy that represents the same OS process as processProxy"

	^ ((processProxy isKindOf: ThisOSProcess)
			and: [pid = processProxy pid])
		and: [sessionID = processProxy sessionID]