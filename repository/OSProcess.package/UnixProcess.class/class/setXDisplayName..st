X display - deprecated
setXDisplayName: xDisplayName
	"Deprecated. See ThisOSProcess>>setXDisplayName"

	"self setXDisplayName: 'unix:0' "
	"self setXDisplayName: ':1' "

	^ OSProcess thisOSProcess setXDisplayName: xDisplayName

