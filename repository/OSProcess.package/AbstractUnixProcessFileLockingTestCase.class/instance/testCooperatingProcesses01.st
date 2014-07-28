testing
testCooperatingProcesses01
	"Two cooperating Squeak processes using file region locking to coordinate their
	writes to a shared file."

	"(self selector: #testCooperatingProcesses01) run"

	| result |
	result := self
		doRemote:
			[(self tryUntil: [(accessor lockFile: fileStream from: 100 to: 120) notNil]) ifNil: [self quitImage].
			fileStream position: 100.
			fileStream nextPutAll: 'THIS '.
			accessor unlockFile: fileStream from: 100 to: 120.
			delay wait.
			self tryUntil: [(accessor lockFile: fileStream from: 108 to: 120) notNil].
			fileStream position: 108.
			fileStream nextPutAll: 'A '.
			accessor unlockFile: fileStream from: 108 to: 120.
			delay wait.
			self quitImage]
		doLocal:
			[self assert: (self tryUntil: [(accessor lockFile: fileStream from: 104 to: 120) notNil]).
			fileStream position: 105.
			fileStream nextPutAll: 'IS '.
			accessor unlockFile: fileStream from: 104 to: 120.
			delay wait.
			self tryUntil: [(accessor lockFile: fileStream from: 108 to: 120) notNil].
			fileStream position: 110.
			fileStream nextPutAll: 'TEST '.
			accessor unlockFile: fileStream from: 108 to: 120.
			delay wait].
	self tryUntil: [(accessor lockFile: fileStream from: 100 to: 140) notNil].
	fileStream position: 100.
	result := fileStream next: 14.
	accessor unlockFile: fileStream from: 100 to: 140.
	self assert: result = 'THIS IS A TEST'
