display management
displayOnXServer: xDisplayName
	"Check if it is possible to open a display on the X server identified by
	xDisplayName. If so, close the current X display and reopen it on
	the new server. On success, answer the previous display name. On
	failure, answer a string with an error message. This method is expected
	to be called by a web server or other application which may wish to
	make use of the result string."

	"self thisOSProcess displayOnXServer: ':0.0' "
	"self thisOSProcess displayOnXServer: 'unix:0' "
	"self thisOSProcess displayOnXServer: ':1' "
	"self thisOSProcess displayOnXServer: 'noSuchMachine'"
	"self thisOSProcess displayOnXServer: 'noSuchMachine:0'" "<-make sure network is running first!"

	| previousDisplayName |
	(xDisplayName isKindOf: String)
		ifFalse: [^ 'expected display name string'].
	previousDisplayName := self currentXDisplayName.
	(self canConnectToXDisplay: xDisplayName)
		ifTrue:
			[self decapitate.
			self setXDisplayName: xDisplayName.
			self recapitate.
			^ previousDisplayName]
		ifFalse:
			[^ 'cannot connect to display ', xDisplayName]
