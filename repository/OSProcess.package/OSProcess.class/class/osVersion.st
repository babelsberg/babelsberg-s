version dependent
osVersion
	"After Squeak version 3.6, #osVersion was moved to SmalltalkImage. Some
	versions of Pharo move this to OSPlatform and issue deprecation warnings
	about the other usages. Pharo3 deprecated OSPlatform direct access."

	"self osVersion"
	
	self isPharo3AndLater
		ifTrue: [ ^ (Smalltalk perform: #os) version ].
	^ (((Smalltalk hasClassNamed: #OSPlatform)
			and: [(Smalltalk at: #OSPlatform)
					respondsTo: #osVersion])
		ifTrue: [Smalltalk at: #OSPlatform]
		ifFalse: [((Smalltalk classNamed: 'SmalltalkImage')
				ifNil: [^ Smalltalk osVersion]) current]) osVersion