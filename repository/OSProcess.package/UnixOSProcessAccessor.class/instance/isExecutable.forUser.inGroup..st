file testing
isExecutable: aPathName forUser: uid inGroup: gid
	"Answer true if file at aPathName has execute permission for a user
	identified by user uid and group gid."

	"OSProcess accessor
		isExecutable: '/bin/sh'
		forUser: OSProcess accessor primGetUid
		inGroup: OSProcess accessor primGetGid"

	| fStat suid sgid user group protectionMask |
	fStat := self fileStat: aPathName.
	(fStat isKindOf: String)
		ifTrue: [self inform: aPathName, ': ', fStat. ^ nil].
	protectionMask := fStat at: 3.
	((protectionMask at: 4) allMask: 1)
		ifTrue: [^ true]. "Test executable by any user ID"
	sgid := (protectionMask at: 1) allMask: 2.
	sgid
		ifTrue: [group := gid]
		ifFalse: [group := fStat at: 2].
	((gid == group) and: [(protectionMask at: 3) allMask: 1])
		ifTrue: [^ true]. "Test executable by my group ID"
	suid := (protectionMask at: 1) allMask: 4.
	suid
		ifTrue: [user := uid]
		ifFalse: [user := fStat at: 1].
	((uid == user) and: [(protectionMask at: 2) allMask: 1])
		ifTrue: [^ true]. "Test executable by my user ID"
	^ false

