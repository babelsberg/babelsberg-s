temp files and directories
mkdtemp: templateString
	"Call mkdtemp() to generate a uniquely named temporary directory from a template
	string. The last six or more characters of template must be XXXXXX and these are
	replaced with characters that make the directory name unique. The directory is then
	created with permissions 0700. Answer the new directory name."

	"OSProcess accessor mkdtemp: 'foodir.XXXXXX' "

	^self primMkdtemp: templateString
