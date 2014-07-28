file testing
isExecutable: aPathName
	"Answer true if file at aPathName has execute permission for this process."

	"OSProcess accessor isExecutable: '/bin/sh'"
	"OSProcess accessor isExecutable: '/no/such/file'"

	^ self isExecutable: aPathName forUser: self primGetUid inGroup: self primGetGid

