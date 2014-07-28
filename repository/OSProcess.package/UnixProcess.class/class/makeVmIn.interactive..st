utility - VM building
makeVmIn: buildDirectoryPathName interactive: aBoolean
	"Rebuild the virtual machine and plugins in the buildDirectoryPathName
	directory. If the build is successful, save the image and restart using the
	new VM. This assumes that the currently executing VM is either located in,
	or linked to, the buildDirectoryPathName directory. If aBoolean is true,
	display interactive dialogs, otherwise output goes only to the Transcript."

	"UnixProcess makeVmIn: '/usr/local/squeak/Squeak-2.8/build' interactive: true"

	| commandString result |
	commandString := 'cd ', buildDirectoryPathName, '; make'.
	Transcript cr; show: 'running external command "', commandString, '"'; cr.
	result := self waitForCommandOutputArray: commandString.
	((result at: 3) == 0 and: [(result at: 2) isEmpty])
		ifTrue:
			[Transcript show: 'make completed successfully, restarting VM'; cr.
			aBoolean ifTrue:
				[self inform: 'make completed successfully, restarting VM'].
			self quitAndRestart]
		ifFalse:
			[Transcript show: (result at: 2); cr.
			Transcript show: 'make did not succeed, VM will not be restarted'; cr.
			aBoolean ifTrue:
				[self inform: 'make did not succeed, VM will not be restarted'.
				self inform: (result at: 2)]].
	^ result
