accessing
eventGenerator
	"Answer the value of eventGenerator"

	^ eventGenerator ifNil: [eventGenerator := self eventGeneratorProcess]