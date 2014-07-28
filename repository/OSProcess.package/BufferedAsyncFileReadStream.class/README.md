BufferedAsyncFileReadStream adds output buffering behavior to an event driven file stream, permitting blocking reads without risk of blocking the Squeak VM. This is useful for OS pipes, for which Squeak may wish to read and write the pipe without concern for VM deadlocks.

A BufferedAsyncFileReadStream may be set for either blocking or nonblocking reads. When in blocking mode, a Smalltalk Process that requests a read will be blocked until data is available, but the VM will not be blocked and other Smalltalk Processes can proceed normally.

Whenever data becomes available, a dataAvailableSemaphore is signalled and a #changed event is generated.