platform identification
isUnixMac
	"True if the platform is Mac OS on OSX"

	"OSProcess isUnixMac"

	| osVersion numericOsVersion |
	osVersion := self osVersion.
	^ ('darwin*' match: osVersion "Ian's VM")
		or: [numericOsVersion := osVersion asInteger ifNil: [0].
			(self platformName = 'Mac OS') and: [numericOsVersion >= 1000] "John's VM"]
