utility - image save
saveImageInBackgroundNicely
	"Save image in a background OS process with lowered scheduling priority."

	"UnixProcess saveImageInBackgroundNicely"

	^ self saveImageInBackground: self uniqueNameForSavedImage nice: true
