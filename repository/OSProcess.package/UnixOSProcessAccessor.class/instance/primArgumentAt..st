external process access
primArgumentAt: index
	"Answer the argument string in the argument OS process argument list at position index.
	In Unix, the first element of the list is the program name, and any additional elements
	of the list are optional command line arguments passed to the program. This convention
	may be simulated by the C runtime libraries on other operating systems, but argument
	list handling should be assumed to be operating system dependent."

	<primitive: 'primitiveArgumentAt' module: 'UnixOSProcessPlugin'>
	^ nil