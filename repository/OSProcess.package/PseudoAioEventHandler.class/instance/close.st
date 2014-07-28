initialize-release
close
	"When the FileStream or Socket handled by this aio handler is closed,
	it should send #close to this handler."

	eventGenerator ifNotNil: [eventGenerator terminate]