I represent a pipe provided by the underlying operating system, such as a Unix pipe. I have a reader stream and a writer stream which behave similarly to a read-only FileStream and a writeable FileStream.

I use a single-character buffer to implement #peek without losing data from the external OS pipe.