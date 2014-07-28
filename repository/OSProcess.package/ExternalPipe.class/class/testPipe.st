examples
testPipe
	"OSPipe testPipe inspect"

	| pipe result |
	pipe := self new.
	pipe nextPutAll: 'string to send through an OSPipe'.
	pipe writer close.
	result := pipe upToEnd.
	pipe close.
	^ result
