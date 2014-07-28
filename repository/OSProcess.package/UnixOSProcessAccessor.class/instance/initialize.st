initialize - release
initialize
	"Call this method when an instance is first created, or to refresh after an image
	restart to clean up from the previous session. Notify dependents of my singleton
	instance if the image has restarted in a different OS process (this is not the case
	when #startUp is called after a simple image save)."

	self finalize.
	super initialize.
	ThisProcessPid ~~ self primGetPid
		ifTrue: 
			["Image has been restarted and is now running in a different OS process"
			ThisProcessPid := self primGetPid.
			self changed: #startUp].
	self changed.
	self restartChildWatcherProcess.

