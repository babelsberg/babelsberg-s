session identification
getSessionIdentifier
	"Call a primitive to obtain the unique identifier for this Squeak session. If the
	primitive fails, try to deduce the session identifier from an instance of
	StandardFileStream. Some versions of the OSProcessPlugin may not be able to
	obtain a session ID, so this provides a mechanism for obtaining the session ID
	indirectly if necessary."

	"OSProcess accessor getSessionIdentifier"

	| session |
	session := self primGetSession.
	session ifNil: [session :=  self getSessionIdentifierFromSourcesFile].
	session ifNil: [session :=  self getSessionIdentifierFromFileInSqueakDirectory].
	^ session
