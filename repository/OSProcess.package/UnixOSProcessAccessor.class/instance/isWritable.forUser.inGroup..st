file testing
isWritable: aPathName forUser: uid inGroup: gid
	"Answer true if file at aPathName has read permission for a user
	identified by user uid and group gid."

	"OSProcess accessor
		isWritable: '/bin/sh'
		forUser: OSProcess accessor primGetUid
		inGroup: OSProcess accessor primGetGid"

	| fStat user group protectionMask |
	fStat := self fileStat: aPathName.
	(fStat isKindOf: String)
		ifTrue: [self inform: aPathName, ': ', fStat. ^ nil].
	protectionMask := fStat at: 3.
	((protectionMask at: 4) allMask: 2)
		ifTrue: [^ true]. "Test writable by any user ID"
	group := fStat at: 2.
	((gid == group) and: [(protectionMask at: 3) allMask: 2])
		ifTrue: [^ true]. "Test writable by my group ID"
	user := fStat at: 1.
	((uid == user) and: [(protectionMask at: 2) allMask: 2])
		ifTrue: [^ true]. "Test writable by my user ID"
	^ false

