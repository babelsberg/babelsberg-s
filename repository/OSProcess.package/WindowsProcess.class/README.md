I represent a Windows operating system process, such as the process in which the Squeak VM is currently running. I collaborate with an instance of WindowsOSProcessAccessor to provide primitive access to the external operating system. My instance variables are maintained as a convenience to allow inspection of an OSProcess. Access to these variables should always be done with my accessor methods, which update the instance variables by querying my WindowsOSProcessAccessor.

My process ID and process handle (a Win32 HANDLE) are held by my pid and processHandle variables. The main thread for this process is held by my mainThread variable.

Standard input, output, and error streams are available, and my be used when the console is open (WindowsProcess>>openConsole). They can also be reassigned to file streams (WindowsOSProcessAccessor>>setStdOut:).

When external processes are created, they are added to my allMyChildren collection, and a thread is created to wait for any of them to exit. This thread is held by my childWatcherThread instance variable while the thread is active, and is also added to my threads collection.

Whenever a child process exits, the childWatcherThread will signal a Semaphore (a Smalltalk Semaphore, not a Windows semaphore), then exit. A Squeak process in my processAccessor waits on this Semaphore, and sends an 'update: #childProcessStatus' message to me. In response to this, I update the status of my active child processes, one or more of which will have exited. If any of my child processes are still active, I set a new childWatcherThread to wait for them to exit.

Note that some Windows applications will exit their main process after creating another application process. These applications will appear to Squeak as if they have exited immediately, even though the application is running.