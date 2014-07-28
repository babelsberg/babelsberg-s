installation
installOn: aClass

	| lock wrappers |
	lock := Semaphore new.
	self flag: #rhi. "Shouldn't that be #allSelectors?!"
	wrappers := aClass selectors asOrderedCollection collect: [:each |
		(self on: each inClass: aClass)
			recursionLock: lock;
			install;
			yourself].
	^ wrappers