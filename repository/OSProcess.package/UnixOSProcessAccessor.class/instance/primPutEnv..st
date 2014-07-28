private - primitive access
primPutEnv: aString
	"Add or update an environment variable in the external OS process using a 'KEY=value'
	string."

	<primitive: 'primitivePutEnv' module: 'UnixOSProcessPlugin'>
	^ nil