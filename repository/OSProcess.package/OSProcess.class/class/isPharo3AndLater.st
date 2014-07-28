version dependent
isPharo3AndLater
	"True if this image is a pharo of major version 3 or greater"

	Smalltalk
		at: #SystemVersion
		ifPresent: [:cls | ((cls canUnderstand: #type) and: [ cls canUnderstand: #major ])
			ifTrue: [^ cls current type = 'Pharo' and: [ cls current major >= 3 ]]].
	^false
