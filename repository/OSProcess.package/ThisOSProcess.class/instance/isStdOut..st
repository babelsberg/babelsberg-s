private - IOHandle
isStdOut: anIOHandle
	"Answer true if anIOHandle represents stdout."

	| realHandle |
	anIOHandle ifNil: [^ false].
	realHandle := self processAccessor getStdOutHandle.
	realHandle ifNil: [^ false].
	UseIOHandle
		ifTrue: [^ anIOHandle handle = realHandle handle]
		ifFalse: [^ anIOHandle = realHandle]
