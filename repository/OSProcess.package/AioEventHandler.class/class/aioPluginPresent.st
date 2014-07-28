testing
aioPluginPresent
	"Answer true if an AIO plugin is available. The value of AioPluginPresent
	is cleared at startup time, and is reestablished once for each Squeak session.
	See initializeAioPluginPresent to initialize after an image startup if warning
	dialog is not desired."

	"AioEventHandler aioPluginPresent"

	^ AioPluginPresent
		ifNil: [AioPluginPresent := self basicNew primAioModuleVersionString notNil.
			AioPluginPresent ifFalse:
				[self notify: 'AioPlugin not present, AioEventHandler will use polling input'].
			^ AioPluginPresent]