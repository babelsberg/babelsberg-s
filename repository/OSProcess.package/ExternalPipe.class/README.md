I represent a pipe provided by the underlying operating system, such as a Unix pipe. I have a reader stream and a writer stream which behave similarly to a read-only FileStream and a writeable FileStream.

Subclasses implement buffering behavior for the reader end of a pipe.