copying
veryDeepFixupWith: deepCopier
	"If some fields were weakly copied, fix new copy here."

	super veryDeepFixupWith: deepCopier.
	p1 := self fixupPoint: p1 with: deepCopier.
	p2 := self fixupPoint: p2 with: deepCopier.
