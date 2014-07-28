CHECKS
countAllInstances
	"doIt: [self countAllInstances]"

	| totalCount |
	totalCount := 0.
	Smalltalk garbageCollect.
	Transcript cr.
	self withAllSubclassesDo: [:each |
		| count |
		count := each allInstances size.
		totalCount := totalCount + count.
		Transcript cr; show: each name, ' -> ', count printString].
	Transcript cr; show: '=== TOTAL COUNT -> ', totalCount printString.