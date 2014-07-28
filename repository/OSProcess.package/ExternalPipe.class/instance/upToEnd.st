accessing
upToEnd
	"Answer the remaining elements in the string"

	reader closed
		ifTrue: [^ '']
		ifFalse: [^ reader upToEnd]