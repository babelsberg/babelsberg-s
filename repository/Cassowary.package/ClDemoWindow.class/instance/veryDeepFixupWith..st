copying
veryDeepFixupWith: deepCopier
	"If some fields were weakly copied, fix new copy here."

	super veryDeepFixupWith: deepCopier.
	grabPoint ifNotNil: [grabPoint := self fixupPoint: grabPoint with: deepCopier].
	dragPoint ifNotNil: [dragPoint := self fixupPoint: dragPoint with: deepCopier].