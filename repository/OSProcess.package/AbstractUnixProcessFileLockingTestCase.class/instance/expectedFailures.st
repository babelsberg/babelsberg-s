failures
expectedFailures
	^UnixOSProcessAccessor basicNew safeToForkSqueak
		ifTrue: [#()]
		ifFalse: [#(	testCooperatingProcesses01
					testCooperatingProcesses02
					testCooperatingProcesses03
					testCooperatingProcesses04
					testCooperatingProcesses05
					testFailFileLockOnLockedFile
					testFailLockOnLockedOverlappedRegion
					testFailLockOnLockedRegion
					testFailLockOnLockedSupersetRegion
					testFailRegionLockOnLockedFile
					testLockEntireFileForWrite01
					testLockEntireFileForWrite02
					testLockEntireFileForWrite03
					testLockEntireFileForWrite04
					testLockEntireFileForWrite05
					testLockEntireFileForWrite06
					testLockRegionForRead01
					testLockRegionForRead02
					testLockRegionForWrite01
					testLockRegionForWrite02
					testLockRegionForWrite03
					testLockRegionForWrite04
					testLockRegionForWrite05
					testLockRegionForWrite06
					testLockRegionForWrite07
					testLockRegionForWrite08
					testNoFailLockOnAdjacentLockedRegions
					testNoFailLockOnDifferentLockedRegion)]