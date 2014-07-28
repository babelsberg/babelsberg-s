temp files and directories
mkstemp: templateString

	"Call mkstemp() to generate a unique temporary file from a template string.
	The last six or more characters of template must be XXXXXX and these are
	replaced with a string that make the filename unique. Contents of the template
	string are modified. The file is created with permissions 0600, that is, read plus
	write for owner only. Answer an opened file stream on the newly created file."

	"OSProcess accessor mkstemp: 'foo.XXXXXX' "

	" | s | { s := 'foo.XXXXXX' . OSProcess accessor mkstemp: s } "

	| fileName sqFile |
	fileName := templateString copy.
	sqFile := self primMkstemp: fileName.
	^ AttachableFileStream
		name: fileName
		attachTo: sqFile
		writable: true
