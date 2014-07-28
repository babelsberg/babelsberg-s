private - primitive access
environmentPut: aString
	"Add or update an environment variable in the external OS process using a 'KEY=value'
	string. Create a null terminated string for use by the external putenv() call in a pluggable
	primitive."

	"OSProcess thisOSProcess processAccessor environmentPut: 'SOMEKEY=somevalue'"

	| cString |
	cString := aString, (Character value: 0) asString.
	^ self primPutEnv: cString
