I am an abstract class whose subclasses provide access to an operating system process, such as the process in which the Squeak VM is currently running. My subclasses collaborate with instances of OSProcess subclasses.

The single instance ThisOSProcessAccessor provides access to the OS process in which the virtual machine is running. On Unix, this instance sets a signal handler to respond to externally generated sigchld signals. This must be done after each image restart in order to call a primitive which informs the VM of the  identity of the semaphore to signal. A similar mechanism is used for Windows to obtain exit status of external OS processes. ThisOSProcessor maintains a process that waits on child exit events and updates a dependent OSProcess of changes to external OS processes.

When an image is restarted on a different kind of platform, a new instance is assigned to ThisOSProcessAccessor to provide access to the virtual machine OS process.
