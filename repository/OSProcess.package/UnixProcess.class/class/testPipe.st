examples
testPipe
	"Create an OS pipe, write some text to it, and read the text back from the 
	other end of the pipe."

	"UnixProcess testPipe inspect"

	| s p r |
	s := 'this is some text to write into the pipe'.
	p := OSPipe new.
	p ifNil: 
		[self noAccessorAvailable.
		^ p].
	p writer nextPutAll: s.
	p writer close.
	r := p reader next: s size.
	p reader close.
	^ r