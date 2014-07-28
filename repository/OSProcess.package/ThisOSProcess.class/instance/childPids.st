child process management
childPids

	^ allMyChildren asArray asArray collect: [ :p | p pid ]
