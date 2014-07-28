accessing
candidatesFromStrategy
	
	currentStrategy 
		ifNotNil: [^ currentStrategy candidates]
		ifNil: [^ self candidates]