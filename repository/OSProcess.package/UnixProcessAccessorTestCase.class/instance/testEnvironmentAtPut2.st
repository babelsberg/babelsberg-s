testing - external process access
testEnvironmentAtPut2
	"This looks for a bug in which the enviroment is successfully, but later gets
	invalidated by memory moves or reallocation."

	"(UnixProcessAccessorTestCase selector: #testEnvironmentAtPut2) run"

	| oldVal newVal resetVal count ws goodResults notFound totallyBogus |
	oldVal := accessor environmentAt: 'AAAA'.
	newVal := 'this is a test string'.
	accessor environmentAt: 'AAAA' put: newVal.
	resetVal := accessor environmentAt: 'AAAA'.
	self should: [resetVal notNil and: [resetVal isEmpty not]].
	self should: [newVal = resetVal].

	count := 50000.
	ws := WriteStream on: Array new.
	count timesRepeat: [ws nextPut: (accessor environmentAt: 'AAAA')].
	goodResults := ws contents select: [:e | e = newVal].
	notFound := ws contents select: [:e | e isNil].
	totallyBogus := ws contents select: [:e | e notNil and: [e ~= newVal]].

	"Uncomment the following to see when the problem is happening"
	"(Array with: goodResults with: notFound with: totallyBogus) inspect."

	self should: [goodResults size == count].
	self should: [notFound isEmpty].
	self should: [totallyBogus isEmpty].

	accessor environmentAt: 'AAAA' put: oldVal.
	self should: [oldVal = (accessor environmentAt: 'AAAA')]
