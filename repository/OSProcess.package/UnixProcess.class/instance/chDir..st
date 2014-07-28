environment
chDir: pathString
	"Change current working directory, and update $PWD if it exists in the environment.
	Answer nil for success, or an error message."

	"OSProcess thisOSProcess chDir: '/tmp'"
	"OSProcess thisOSProcess chDir: '/no/such/path'"
	"OSProcess thisOSProcess chDir: OSProcess defaultPathString"

	| realPath result |
	realPath := self processAccessor realpath: pathString.
	realPath ifNil: [realPath := pathString].
	result := self processAccessor chDir: realPath.
	result isNil
		ifTrue:
			[(self environmentAt: #PWD)
				ifNotNil:
					[self environmentAt: #PWD put: realPath.
					^ nil]]
		ifFalse:
			[self inform: realPath, ': ', result.
			^ result]