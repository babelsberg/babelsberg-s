display management
canConnectToXDisplay: xDisplayName
	"Open and close a connection to displayName. It the connection was successfully
	opened, answer true; otherwise false. This is intended to check for the ability
	to open an X display prior to actually making the attempt."

	"self thisOSProcess canConnectToXDisplay: ':0.0' "
	"self thisOSProcess canConnectToXDisplay: ':1' "
	"self thisOSProcess canConnectToXDisplay: 'bogus:0' " "<-make sure network is running first!"

	(xDisplayName isKindOf: String) ifFalse: [^ false].
	^ self processAccessor primCanConnectToXDisplay: xDisplayName
