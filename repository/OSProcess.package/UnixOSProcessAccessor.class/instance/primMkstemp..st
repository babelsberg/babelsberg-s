private - primitive access
primMkstemp: templateString
	"Call mkstemp() to generate a unique temporary file from a template string.
	The last six characters of template must be XXXXXX and these are replaced with
	a string that make the filename unique. Answer a SQFile descriptor for the file stream.
	
	Contents of the template string are modified, and provide the name of the newly
	created file.

	The  file  is  created  with permissions 0600, that is, read plus write for owner only.

	Sender must convert the file descriptor to a FileStream before it can be used."

	<primitive: 'primitiveMkstemp' module: 'UnixOSProcessPlugin'>
	^ self primitiveFailed
