IO redirection
redirectStdErrTo: fileStream
	"Redirect the standard error stream to another output stream."

	^ self redirect: self stdErr to: fileStream
