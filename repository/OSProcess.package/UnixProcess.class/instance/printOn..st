printing
printOn: aStream
	"In English, say 'a Unix' rather than 'an Unix'. Therefore do not use super printOn, which
	treats $U as a vowel."

	self ppid.		"Force update of ppid, in case parent may have exited."
	aStream nextPutAll: 'a ';
			nextPutAll: self class name;
			nextPutAll: ' with pid ';
			nextPutAll: self pid printString
