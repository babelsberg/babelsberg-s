fork and exec
primNice: inc
	"Change the scheduling priority of this OS process by the given nice increment."

	<primitive: 'primitiveNice' module: 'UnixOSProcessPlugin'>
	^ nil
