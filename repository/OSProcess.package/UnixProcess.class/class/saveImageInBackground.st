utility - image save
saveImageInBackground
	"Save image in a background OS process."

	"UnixProcess saveImageInBackground"

	^ self saveImageInBackground: self uniqueNameForSavedImage nice: false
