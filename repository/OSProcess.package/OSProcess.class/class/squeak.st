external command processing
squeak
	"Start a new instance of Squeak running in a child OS process. The new instance
	will restart from the image file, so it is a clone of this image as it existed at the
	most recent image save. Note that subclasses can implement additional methods of
	starting Squeak images, especially for Unix systems."

	"OSProcess squeak"

	^ self thisOSProcess squeak

