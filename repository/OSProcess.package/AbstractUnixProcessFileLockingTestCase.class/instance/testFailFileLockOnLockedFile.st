testing - exclusive locking
testFailFileLockOnLockedFile
	"Two cooperating Squeak processes using mandatory file locking. When
	child Squeak takes a lock on a region, lock attempt in parent Squeak will
	fail."

	"(self selector: #testFailFileLockOnLockedFile) run"

	self
		doRemote:
			[(self tryUntil: [(accessor lockFile: fileStream) notNil]) ifNil: [self quitImage].
			delay wait; wait; wait.
			accessor unlockFile: fileStream.
			self quitImage]
		doLocal:
			[self should: [
				10 timesRepeat: [ "lock and unlock until failure due to child taking the lock"
					accessor lockFile: fileStream
							exclusive: true
							ifFail: [self error: '#lockFile failed because child Squeak now holds a lock'].
					accessor unlockFile: fileStream. "release lock to allow child to acquire it"
					delay wait]]
				raise: Error
				description: '#lockFile failed because child Squeak now holds a lock']
