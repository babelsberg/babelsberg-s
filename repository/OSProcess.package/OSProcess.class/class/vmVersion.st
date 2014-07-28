version dependent
vmVersion 
	"After Squeak version 3.6, #vmVersion was moved to SmalltalkImage. Pharo3 deprecated vmVersion."

	self isPharo3AndLater
		ifTrue: [ ^ (Smalltalk perform: #vm) version ].
	^ ((Smalltalk classNamed: 'SmalltalkImage')
		ifNil: [^ Smalltalk vmVersion]) current vmVersion