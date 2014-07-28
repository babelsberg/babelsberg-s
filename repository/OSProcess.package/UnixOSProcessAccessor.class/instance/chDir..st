external process access
chDir: pathString
	"Change current working directory. The $PWD environment variable is not updated (but
	see UnixProcess>>chDir:). Answer nil for success, or an error message."

	"OSProcess accessor chDir: '/tmp'"
	"OSProcess accessor chDir: '/no/such/path'"
	"OSProcess accessor chDir: FileDirectory default name"

	| result message |
	result := self primChdir: pathString.
	result isNil
		ifTrue:
			[^ nil]
		ifFalse:
			[message := self primErrorMessageAt: result.
			^ message]
