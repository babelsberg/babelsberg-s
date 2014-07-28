testing
canControlXDisplay
	"True if the XDisplayControlPlugin is accessible. Older versions of OSProcess relied on
	the X display control to be embedded in the OSProcessPlugin module. This has been
	moved to a separate display control plugin to allow support of non-X platforms and
	other display media on Unix platforms (OS X)."

	"OSProcess accessor canControlXDisplay"

	^ self primXDisplayControlPluginModuleName notNil
