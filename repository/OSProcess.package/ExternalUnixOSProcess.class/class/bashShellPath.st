shells
bashShellPath
	"A more full-featured shell from the Free Software Foundation"

	| path |
	path := '/bin/bash'.
	(OSProcess fileExists: path)
		ifTrue: [^ path]
		ifFalse: [self notify: path, ' not found']