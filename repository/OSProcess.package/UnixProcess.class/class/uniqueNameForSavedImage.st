utility - image save
uniqueNameForSavedImage
	"A time stamped image name that will sort in date order in a directory listing"

	"UnixProcess uniqueNameForSavedImage"

	| now month day hour minute second |
	now := DateAndTime now.
	month := now month asString.
	day := now dayOfMonth asString.
	hour := now hour24 asString.
	minute := now minute asString.
	second := now second asString.
	^ 'squeak-',
		now year asString,
		(month size < 2 ifTrue: ['0', month] ifFalse: [month]),
		(day size < 2 ifTrue: ['0', day] ifFalse: [day]),
		(hour size < 2 ifTrue: ['0', hour] ifFalse: [hour]),
		(minute size < 2 ifTrue: ['0', minute] ifFalse: [minute]),
		(second size < 2 ifTrue: ['0', second] ifFalse: [second])
