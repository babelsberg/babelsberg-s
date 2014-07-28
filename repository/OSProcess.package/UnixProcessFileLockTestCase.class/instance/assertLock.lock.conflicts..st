asserting
assertLock: lock1 lock: lock2 conflicts: aBoolean
	self assert: (lock1 conflictsWith: lock2) = aBoolean.
	self assert: (lock2 conflictsWith: lock1) = aBoolean.