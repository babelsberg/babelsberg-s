testing - exclusive locking
testNoFailLockOnAdjacentLockedRegions
	"Two cooperating Squeak processes using mandatory file locking. When
	child Squeak takes a lock on a region, lock attempt in parent Squeak will
	fail. No failure occurs when the regions are adjacent but do not overlap."

	"(self selector: #testNoFailLockOnAdjacentLockedRegions) run"

	self
		doRemote:
			[(self tryUntil: [(accessor lockFile: fileStream from: 100 to: 103) notNil]) ifNil: [self quitImage].
			delay wait; wait; wait.
			accessor unlockFile: fileStream from: 100 to: 103.
			self quitImage]
		doLocal:
			[self shouldnt: [
				10 timesRepeat: [ "lock and unlock until failure due to child taking the lock"
					accessor lockFile: fileStream
							from: 104
							to: 120
							exclusive: true
							ifFail: [self error: '#lockFile failed because child Squeak now holds a lock'].
					accessor unlockFile: fileStream from: 104 to: 120. "release lock to allow child to acquire it"
					delay wait]]
				raise: Error]
