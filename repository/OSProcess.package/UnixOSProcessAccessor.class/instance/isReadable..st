file testing
isReadable: aPathName
	"Answer true if file at aPathName has read permission for this process."

	"OSProcess accessor isWritable: '/bin/sh'"

	^ self isReadable: aPathName forUser: self primGetUid inGroup: self primGetGid

