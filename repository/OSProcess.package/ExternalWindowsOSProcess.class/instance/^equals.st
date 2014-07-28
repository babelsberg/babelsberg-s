comparing
= processProxy
	"True if this is a proxy that represents the same OS process as processProxy"

	^ ((processProxy isKindOf: ExternalWindowsOSProcess)
			and: [pid = processProxy pid])
				and: [ppid = processProxy ppid]