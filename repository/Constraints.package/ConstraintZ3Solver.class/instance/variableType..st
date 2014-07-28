accessing
variableType: aString

	self variables 
		ifNotEmpty: [self variables do: [:cv | cv type: aString].
					self solve].
	variableType := aString.