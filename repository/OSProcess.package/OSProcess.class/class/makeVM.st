utility
makeVM
	"Rebuild the virtual machine and plugins, assuming that this Squeak
	is running from a home directory in the appropriate place in the
	source code tree. If the build is successful, save the image and
	restart using the new VM."

	"OSProcess makeVM"

	^ self makeVmIn: OSProcess defaultPathString, OSProcess pathSeparator, 'build'
