class initialization
initializeWithAllSubclasses
	"doIt: [self initializeWithAllSubclasses]"

	self withAllSubclassesDo: [:each | each initialize].