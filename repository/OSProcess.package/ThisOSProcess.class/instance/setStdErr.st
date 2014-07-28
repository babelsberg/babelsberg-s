private
setStdErr
	"If stdErr is nil, then set it. If not nil, check to see if it is has a valid connection to
	stderr. If not valid, then replace it, otherwise answer the existing valid stream.
	Obscure bug warning: If a valid AttachableFileStream on stderr is garbage collected,
	then stderr will be closed. It is advisable (but not necessary) to treat the stream
	on stderr as a singleton, but in any case, any extra instances attached to stderr
	should not be allowed to be garbage collected."

	| stdErrHandle |
	stdErr ifNotNil:
			[(self isStdErr: stdErr ioHandle) ifTrue: [^ stdErr]].
	stdErrHandle := self processAccessor getStdErrHandle.
	stdErrHandle ifNotNil:
			[stdErr := AttachableFileStream name: 'stderr' attachTo: stdErrHandle writable: true].
	^ stdErr
