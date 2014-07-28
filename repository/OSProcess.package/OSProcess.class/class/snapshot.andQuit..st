version dependent
snapshot: save andQuit: quit
	"After Squeak version 3.6, #snapshot:andQuit: was moved to SmalltalkImage "

	^ ((Smalltalk classNamed: 'SmalltalkImage')
		ifNil: [^ Smalltalk snapshot: save andQuit: quit embedded: false]) current snapshot: save andQuit: quit