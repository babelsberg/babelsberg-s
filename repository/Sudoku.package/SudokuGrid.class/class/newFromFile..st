instance creation
newFromFile: aFileName

	| file inputString |
	file := StandardFileStream readOnlyFileNamed: aFileName.
	inputString := file upToEnd.
	^ self buildFromString: inputString