shells
remoteShellPath
	"A remote shell processor. This may need to be edited for different systems."

	| path |
	path := '/usr/bin/rsh'.
	(OSProcess fileExists: path)
		ifTrue: [^ path]
		ifFalse: [self notify: path, ' not found']