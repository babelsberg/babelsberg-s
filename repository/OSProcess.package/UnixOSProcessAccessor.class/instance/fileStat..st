file testing
fileStat: aPathString
	"Call stat(2) to obtain the UID, GID, and file protection mask for a file."

	"OSProcess accessor fileStat: '/var/spool/news'"
	"OSProcess accessor fileStat: '/etc/hosts'"
	"OSProcess accessor fileStat: '/bin/su'"
	"OSProcess accessor fileStat: '/bin/NOSUCHFILE'"
	"OSProcess accessor fileStat: 12345"

	| mask |
	(aPathString isKindOf: String) ifFalse: [self error: 'expected a path string'. ^ nil].
	mask := self primFileStat: aPathString.
	(mask == nil) ifTrue: [^ nil].
	(mask isKindOf: Integer)
		ifTrue: [^ self primErrorMessageAt: mask].
	^ mask
