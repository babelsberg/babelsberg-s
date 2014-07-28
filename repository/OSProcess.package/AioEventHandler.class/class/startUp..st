system startup
startUp: resuming
	"Clear the value of AioPluginPresent. The value will be set once when
	#aioPluginPresent is first sent, and will remain set to that value for the
	duration of this Squeak session.
	This method is called by ThisOSProcess>>startUp. AioEventHandler does
	not need to be registered in the system startup list."

	resuming ifTrue: [AioPluginPresent := nil]
