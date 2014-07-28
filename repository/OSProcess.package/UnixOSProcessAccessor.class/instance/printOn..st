printing
printOn: aStream
	"In English, say 'a Unix' rather than 'an Unix'. Therefore do not use super printOn, which
	treats $U as a vowel."

	aStream
		nextPutAll: 'a ';
		nextPutAll: self class name;
		nextPutAll: ' on pid ';
		nextPutAll: self primGetPid printString
