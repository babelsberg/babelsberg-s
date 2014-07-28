accessing
blocking
	"True if reader end is set to blocking mode."

	^ blocking ifNil: [blocking := true]