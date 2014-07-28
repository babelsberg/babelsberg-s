version dependent
listLoadedModules
	"After Squeak version 3.6, #listLoadedModules was moved to SmalltalkImage "

	^ ((Smalltalk classNamed: 'SmalltalkImage')
		ifNil: [^ Smalltalk listLoadedModules]) current listLoadedModules