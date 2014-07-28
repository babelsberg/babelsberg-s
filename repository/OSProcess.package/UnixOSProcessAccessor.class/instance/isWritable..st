file testing
isWritable: aPathName
	"Answer true if file at aPathName has write permission for this process."

	"OSProcess accessor isWritable: '/bin/sh'"

	^ self isWritable: aPathName forUser: self primGetUid inGroup: self primGetGid

