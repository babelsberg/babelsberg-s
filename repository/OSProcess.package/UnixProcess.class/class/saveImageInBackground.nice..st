utility - image save
saveImageInBackground: savedImageName nice: niceFlag
	"When Squeak is used as a server it is sometimes desirable to periodically
	save image snapshots. This method forks a headless Squeak to perform a
	snapshot without impacting the server Squeak. Very little additional memory
	is required to do this because Unix copy-on-write memory management allows
	the two Squeak images to share object memory while the save is performed.
	The saved image is given a time stamped name, and the image name of
	the main server Squeak remains unchanged. If niceFlag is true, the
	background OS process runs at lowered scheduling priority."

	^ self forkHeadlessSqueakAndDo:
		[| st |
		"Delay is required in the background process when forking a headless
		Squeak, probably necessary to permit X session stuff to settle down."
		(Delay forMilliseconds: 500) wait.
		(niceFlag notNil and: [niceFlag]) ifTrue:
			["lower priority of background OS process"
			OSProcess accessor nice: 1].
		st := SmalltalkImage current.
		(SourceFiles at: 2) ifNotNil:
			["ensure that copying the changes file will always work"
			st closeSourceFiles.
			st saveChangesInFileNamed: (st fullNameForChangesNamed: savedImageName)].
		st changeImageNameTo: savedImageName,'.image';
			closeSourceFiles;
			openSourceFiles;  "so SNAPSHOT appears in new changes file"
			saveImageSegments;
			snapshot: true andQuit: true]
