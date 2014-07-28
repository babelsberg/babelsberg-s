accessing
canObtainSessionIdentifierFromPlugin

	^ canObtainSessionIdentifierFromPlugin
		ifNil: [canObtainSessionIdentifierFromPlugin := self primGetSession notNil]