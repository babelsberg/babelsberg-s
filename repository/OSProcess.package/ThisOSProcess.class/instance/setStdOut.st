private
setStdOut
	"If stdOut is nil, then set it. If not nil, check to see if it is has a valid connection to
	stdout. If not valid, then replace it, otherwise answer the existing valid stream.
	Obscure bug warning: If a valid AttachableFileStream on stdout is garbage collected,
	then stdout will be closed. It is advisable (but not necessary) to treat the stream
	on stdout as a singleton, but in any case, any extra instances attached to stdout
	should not be allowed to be garbage collected."

	| stdOutHandle |
	stdOut ifNotNil:
			[(self isStdOut: stdOut ioHandle) ifTrue: [^ stdOut]].
	stdOutHandle := self processAccessor getStdOutHandle.
	stdOutHandle ifNotNil:
			[stdOut := AttachableFileStream name: 'stdout' attachTo: stdOutHandle writable: true].
	^ stdOut
