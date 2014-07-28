shells
tkShellPath
	"The wish command shell for Tk/Tcl. This tends to be installed in a wide variety
	of places, so you may need to edit this method for your system."

	| path |
	path := '/usr/bin/wish'.
	(OSProcess fileExists: path)
		ifTrue: [^ path]
		ifFalse: [self notify: path, ' not found']