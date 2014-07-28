comparing
= processProxy
	"True if this is a proxy that represents the same OS process as processProxy"

	^ ((processProxy isKindOf: ExternalUnixOSProcess)
			and: [pid = processProxy pid])
				and: [ppid = processProxy ppid]