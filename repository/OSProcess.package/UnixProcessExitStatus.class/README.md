A UnixProcessExitStatus represents the exit status of a unix process. This is an integer bit field answered by the wait() system call that contains information about exit status of the process. The meaning of the bit field varies according to the cause of process exit. 

Following a normal process exit, the status may be decoded to provide a small positive integer value in the range 0 - 255, which is the value that is presented by a unix shell as the exit status of a program. If terminated by a signal, the corresponding value is the signal number of the signal that caused process exit.

UnixExitStatus decodes the process exit status in a manner compatible with a typical GNU unix implementation. It is not guaranteed to be portable and may produce misleading results on other unix systems.
