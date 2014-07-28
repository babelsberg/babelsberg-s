shells
defaultShellPath
	"Default shell to run"

	| path |
	path := '/bin/sh'.
	(OSProcess fileExists: path)
		ifTrue: [^ path]
		ifFalse: [self notify: path, ' not found']