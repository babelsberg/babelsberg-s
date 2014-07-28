file testing
fileProtectionMask: aPathString
	"Call stat(2) to obtain the file protection mask for a file."

	"OSProcess accessor fileProtectionMask: '/bin/sh'"
	"OSProcess accessor fileProtectionMask: '/etc/hosts'"
	"OSProcess accessor fileProtectionMask: '/bin/su'"
	"OSProcess accessor fileProtectionMask: '/bin/NOSUCHFILE'"
	"OSProcess accessor fileProtectionMask: 12345"

	| mask |
	(aPathString isKindOf: String) ifFalse: [self error: 'expected a path string'. ^ nil].
	mask := self primFileProtectionMask: aPathString.
	(mask == nil) ifTrue: [^ nil].
	(mask isKindOf: Integer)
		ifTrue: [^ self primErrorMessageAt: mask].
	^ mask
