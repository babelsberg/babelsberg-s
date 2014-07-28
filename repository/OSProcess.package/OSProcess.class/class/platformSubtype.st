version dependent
platformSubtype 
	"After Squeak version 3.6, #platformSubtype was moved to SmalltalkImage "

	"OSProcess platformSubtype"

	self isPharo3AndLater
		ifTrue: [ ^ (Smalltalk perform: #os) perform: #subtype ].
	^ ((Smalltalk classNamed: 'SmalltalkImage')
		ifNil: [^ Smalltalk platformSubtype]) current platformSubtype