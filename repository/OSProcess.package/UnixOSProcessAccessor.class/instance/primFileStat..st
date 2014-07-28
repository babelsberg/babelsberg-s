private - primitive access
primFileStat: aPathString
	"Call stat(2) to obtain the file protection mask for a file. Answer errno on failure,
	or on success answer an array with: UID with: GID with: protectionMask. The	
	protectionMask is an Array of four integers representing the protection mask, or
	answer errno on failure. The protection mask is four Integers, each of which may
	be considered an octal digit (0-7), with bit values 4, 2, and 1. The first digit selects
	the set user ID (4) and set group ID (2) and save text image (1) attributes. The second
	digit selects permissions for the user who owns the file: read (4), write (2), and
	execute (1); the third selects permissions for other users in the file's group, with
	the same values; and the fourth for other users not in the file's group, with the
	same values."

	<primitive: 'primitiveFileStat' module: 'UnixOSProcessPlugin'>
	^ nil
