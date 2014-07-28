I provide access to the operating system process in which the Squeak VM is currently running. I am based on the Unix process model. There is only one instance of me, and instances of UnixOSProcess depend on me to provide access to the operating system process which they represent.

I know how to create child processes. I use a semaphore to receive signals when child processes die, and I notify my dependents (instances of UnixOSProcess) when these events occur.

