testing
testSessionIdentifier
	"This is an indirect way to make sure that the primitive for obtaining the session ID does
	not get out of kilter with respect to the method for obtaining session ID from an existing
	open file. The dangerous failure mode is if the SQFile data stucture format changes and
	OSProcess does not get updated to reflect the change.

	As of approximately Squeak 3.8 and beyond, the session id has been moved to the
	first slot of the data structure. Deducing the session ID from an open file will not
	work for a Squeak VM beyond that point, and will not work for any 64 bit VM.
	OSPP version 4.0 or higher obtains session ID from the interpreter, so this is no
	longer an issue. Skip this test for OSPP 4.0 and higher."

	"(UnixProcessAccessorTestCase selector: #testSessionIdentifier) debug"

	| installedOSPPMajorVersion |
	self should: [accessor getSessionIdentifier isKindOf: ByteArray].
	installedOSPPMajorVersion := (OSProcess accessor osppModuleVersionString
		ifNil: [-1]) asInteger.
	(installedOSPPMajorVersion >= 4)
		ifTrue: ["ignore this test"]
		ifFalse: [self should:
			[accessor getSessionIdentifierFromSourcesFile = accessor getSessionIdentifier]]
