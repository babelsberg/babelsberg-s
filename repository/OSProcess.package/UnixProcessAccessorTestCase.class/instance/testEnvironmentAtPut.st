testing - external process access
testEnvironmentAtPut

	"(UnixProcessAccessorTestCase selector: #testEnvironmentAtPut) run"

	| oldPath newPath resetPath s |
	oldPath := accessor environmentAt: 'PATH'.
	newPath := 'this is a test string'.
	accessor environmentAt: 'PATH' put: newPath.
	resetPath := accessor environmentAt: 'PATH'.
	self should: [newPath = resetPath].
	accessor environmentAt: 'PATH' put: oldPath.
	resetPath := accessor environmentAt: 'PATH'.
	self should: [oldPath = resetPath].
	s := WriteStream on: String new.
	10000 timesRepeat: [s nextPutAll: 'Do something to provoke garbage collection'].
	resetPath := accessor environmentAt: 'PATH'.
	self should: [oldPath = resetPath].


