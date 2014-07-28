testing
initializeAioPluginPresent
	"Initialize the AioPluginPresent flag silently without invoking a warning
	if the plugin is not present, and answer the value of the flag. Send this
	to prevent a warning dialog from being presented after image startup,
	as may be preferred if the image is to be run headless."

	"AioEventHandler initializeAioPluginPresent"

	^ AioPluginPresent
		ifNil: [AioPluginPresent := self basicNew primAioModuleVersionString notNil]