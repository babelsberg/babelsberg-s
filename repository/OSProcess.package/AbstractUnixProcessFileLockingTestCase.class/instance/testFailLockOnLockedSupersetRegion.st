testing - exclusive locking
testFailLockOnLockedSupersetRegion
	"Two cooperating Squeak processes using mandatory file locking. When
	child Squeak takes a lock on a region, lock attempt in parent Squeak will
	fail. Fail when requesting a lock on a subset of the locked region."

	"(self selector: #testFailLockOnLockedSupersetRegion) run"

	self
		doRemote:
			[(self tryUntil: [(accessor lockFile: fileStream from: 100 to: 140) notNil]) ifNil: [self quitImage].
			delay wait; wait; wait.
			accessor unlockFile: fileStream from: 100 to: 140.
			self quitImage]
		doLocal:
			[self should: [
				10 timesRepeat: [ "lock and unlock until failure due to child taking the lock"
					accessor lockFile: fileStream
							from: 104
							to: 120
							exclusive: true
							ifFail: [self error: '#lockFile failed because child Squeak now holds a lock'].
					accessor unlockFile: fileStream from: 104 to: 120. "release lock to allow child to acquire it"
					delay wait]]
				raise: Error
				description: '#lockFile failed because child Squeak now holds a lock']
