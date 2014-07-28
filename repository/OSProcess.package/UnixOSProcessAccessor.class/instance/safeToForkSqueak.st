fork and exec
safeToForkSqueak
	"The forkSqueak method is currently supported only for X11 displays with
	XDisplayControlPlugin available. If the plugin is not available, the child Squeak
	VM will continue interacting with the X display, which leads to errors in the
	parent Squeak, including VM crashes."

	^self canControlXDisplay