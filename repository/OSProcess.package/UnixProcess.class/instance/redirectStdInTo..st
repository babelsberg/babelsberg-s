IO redirection
redirectStdInTo: fileStream
	"Redirect the standard input stream to another input stream."

	^ self redirect: self stdIn to: fileStream
