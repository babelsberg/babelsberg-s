X display - deprecated
displayOnXServer: xDisplayName
	"Deprecated. See ThisOSProcess>>displayOnXServer"

	"self displayOnXServer: ':0.0' "
	"self displayOnXServer: 'unix:0' "
	"self displayOnXServer: ':1' "
	"self displayOnXServer: 'noSuchMachine'"
	"self displayOnXServer: 'noSuchMachine:0'" "<-make sure network is running first!"

	^ OSProcess thisOSProcess displayOnXServer: xDisplayName