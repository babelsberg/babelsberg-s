private
setStdIn
	"If stdIn is nil, then set it. If not nil, check to see if it is has a valid connection to
	stdin. If not valid, then replace it, otherwise answer the existing valid stream.
	Obscure bug warning: If a valid AttachableFileStream on stdin is garbage collected,
	then stdin will be closed. It is advisable (but not necessary) to treat the stream
	on stdin as a singleton, but in any case, any extra instances attached to stdin
	should not be allowed to be garbage collected."

	| stdInHandle |
	stdIn ifNotNil:
			[(self isStdIn: stdIn ioHandle) ifTrue: [^ stdIn]].
	stdInHandle := self processAccessor getStdInHandle.
	stdInHandle ifNotNil:
			[stdIn := AttachableFileStream name: 'stdin' attachTo: stdInHandle writable: false].
	^ stdIn

