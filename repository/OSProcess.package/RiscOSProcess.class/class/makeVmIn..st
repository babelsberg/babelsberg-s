utility
makeVmIn: buildDirectoryPathName
	"Rebuild the virtual machine and plugins in the buildDirectoryPathName
	directory. If the build is successful, save the image and restart
	using the new VM. This assumes that the currently executing VM is
	either located in, or linked to, the buildDirectoryPathName directory."
