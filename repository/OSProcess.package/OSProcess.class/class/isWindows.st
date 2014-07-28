platform identification
isWindows
	"True if the platform is an MS Windows OS"

	"OSProcess isWindows"

	^ self platformName = 'Win32'