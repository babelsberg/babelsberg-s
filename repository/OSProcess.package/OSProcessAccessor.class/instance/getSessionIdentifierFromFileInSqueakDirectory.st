session identification
getSessionIdentifierFromFileInSqueakDirectory
	"Deduce the session identifier using method of last resort.
	This is an unreliable method, because it assumes knowledge of the internal structure
	of the SQFile data structure.

	Deprecated:
	As of approximately Squeak 3.8 and beyond, the session id has been moved to the
	first slot of the data structure. This method will not work for a Squeak VM beyond
	that point, and will not work for any 64 bit VM. However, an reliable means of
	obtaining sessionID is now available (#getSessionIdentifier), so this method is retained
	only for backwards compatibility to allow OSPP to be built on an older VMMaker."

	"OSProcess accessor getSessionIdentifierFromFileInSqueakDirectory"

	| id s |
	(OSProcess directoryEntryNames: OSProcess defaultPathString) do:
		[:n | (s := FileStream readOnlyFileNamed: n) ifNotNil:
			[(Smalltalk hasClassNamed: #IOHandle)
				ifTrue: [id := s ioHandle getHandle copyFrom: 5 to: 8]
				ifFalse: [(id := s fileID) ifNotNil: [id copyFrom: 5 to: 8]].
			s close.
			^ id]].
	^ nil
