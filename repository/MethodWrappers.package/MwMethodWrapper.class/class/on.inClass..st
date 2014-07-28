instance creation
on: aSymbol inClass: aClass

	| wrapper |
	(self canWrap: aSymbol inClass: aClass) ifFalse: [^ nil].
	wrapper := self new.
	wrapper class: aClass selector: aSymbol.
	^ wrapper