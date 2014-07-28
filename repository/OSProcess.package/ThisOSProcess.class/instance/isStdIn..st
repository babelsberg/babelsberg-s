private - IOHandle
isStdIn: anIOHandle
	"Answer true if anIOHandle represents stdin."

	| realHandle |
	anIOHandle ifNil: [^ false].
	realHandle := self processAccessor getStdInHandle.
	realHandle ifNil: [^ false].
	UseIOHandle
		ifTrue: [^ anIOHandle handle = realHandle handle]
		ifFalse: [^ anIOHandle = realHandle]
