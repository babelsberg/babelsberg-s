private - primitive access
primUnsetEnv: aKeyString
	"Remove an environment variable from the external OS process environment."

	<primitive: 'primitiveUnsetEnv' module: 'UnixOSProcessPlugin'>
	^ nil