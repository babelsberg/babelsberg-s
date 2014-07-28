copying
veryDeepFixupWith: deepCopier
	"If some fields were weakly copied, fix new copy here."

	super veryDeepFixupWith: deepCopier.
	p1 := self fixupPoint: p1 with: deepCopier.
	p2 := self fixupPoint: p2 with: deepCopier.
	p3 := self fixupPoint: p3 with: deepCopier.
	p4 := self fixupPoint: p4 with: deepCopier.
	m1 := self fixupPoint: m1 with: deepCopier.
	m2 := self fixupPoint: m2 with: deepCopier.
	m3 := self fixupPoint: m3 with: deepCopier.
	m4 := self fixupPoint: m4 with: deepCopier.
