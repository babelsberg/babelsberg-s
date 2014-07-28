private - primitive access
primMkdtemp: templateString
	"Call mkdtemp() to generate a uniquely named temporary directory from a template
	string. The last six characters of template must be XXXXXX and these are replaced
	with characters that make the directory name unique. The directory is then created
	with permissions 0700. Answer the new directory name."

	<primitive: 'primitiveMkdtemp' module: 'UnixOSProcessPlugin'>
	^ self primitiveFailed
