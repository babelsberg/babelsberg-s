X display - deprecated
canConnectToXDisplay: xDisplayName
	"Deprecated. See ThisOSProcess>canConnectToXDisplay:"

	"self canConnectToXDisplay: ':0.0' "

	^ self thisOSProcess canConnectToXDisplay: xDisplayName
