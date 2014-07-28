display management
setXDisplayName: xDisplayName
	"Set X display name for use by the next call to recapitate"

	"self thisOSProcess setXDisplayName: 'unix:0' "
	"self thisOSProcess setXDisplayName: ':1' "

	self processAccessor primSetXDisplayName: xDisplayName

