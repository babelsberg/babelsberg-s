external process access
environmentAt: aSymbolOrString put: aString
	"Add or update an environment variable in the external OS process. Convert aSymbol
	and aString into a KEY=value string and pass this to the OS process environment.
	Standard C libraries provide a putenv() function for this purpose, with a parameter
	in the form KEY=value. Note: Maintain a reference to the return value, see note in
	primitivePutEnv."

	"OSProcess accessor environmentAt: 'AAAA' put: 'this is the value of AAAA'"
	"OSProcess accessor environmentAt: 'AAAA' put: nil"
	"OSProcess accessor environmentAt: 'AAAA'"

	aString isNil
		ifTrue:
			[^ self primUnsetEnv: aSymbolOrString, (Character value: 0) asString]
		ifFalse:
			[^ self environmentPut: (aSymbolOrString asString, '=', aString)]
