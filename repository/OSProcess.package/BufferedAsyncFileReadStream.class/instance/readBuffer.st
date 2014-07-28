accessing
readBuffer
	"Read ahead buffer, filled asynchronously as data becomes available on the IO channel"

	^ readBuffer ifNil: [readBuffer := ReadWriteStream on: String new]
