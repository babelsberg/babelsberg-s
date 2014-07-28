accessing
pwd

	pwd ifNil: [pwd := self accessor primGetCurrentWorkingDirectory].
	^ pwd