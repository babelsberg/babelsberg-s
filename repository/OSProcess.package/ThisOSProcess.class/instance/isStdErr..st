private - IOHandle
isStdErr: anIOHandle
	"Answer true if anIOHandle represents stderr."

	| realHandle |
	anIOHandle ifNil: [^ false].
	realHandle := self processAccessor getStdErrHandle.
	realHandle ifNil: [^ false].
	UseIOHandle
		ifTrue: [^ anIOHandle handle = realHandle handle]
		ifFalse: [^ anIOHandle = realHandle]
