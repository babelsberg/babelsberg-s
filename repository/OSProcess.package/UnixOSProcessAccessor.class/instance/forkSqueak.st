fork and exec
forkSqueak
	"Clone this Squeak Smalltalk image in a child OSProcess. The child is the same as the
	parent, except for its new X session connection, and the return value of this method,
	which is zero for the child process, and a positive integer equal to the pid of the child
	for the parent process.

	The child should not depend on using existing connections to external resources. For
	example, the child may lose its connections to stdin, stdout, and stderr after its parent
	exits."

	self safeToForkSqueak
		ifTrue: [^self primForkSqueak].
	[self notify: 'forkSqueak requires XDisplayControlPlugin']
		ensure: [^nil]
