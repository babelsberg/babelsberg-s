private - primitive access
primMktemp: templateString
	"Call mktemp() to generate a unique temporary filename from a template string.
	The last six characters of template must be XXXXXX and these are replaced with
	a string that make the filename unique. The templateString must be a mutable
	string, because the primitive will change its contents.
	
	Use primitiveMkstemp to avoid file creation race condition, see man 3 mktemp."

	<primitive: 'primitiveMktemp' module: 'UnixOSProcessPlugin'>
	^ self primitiveFailed
