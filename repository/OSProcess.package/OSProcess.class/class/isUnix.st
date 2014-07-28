platform identification
isUnix
	"True if the platform is Unix (including Linux, Mac OS X, or other unix-like OS).
	Note: Keep this method in sync with UnixOSProcessPlugin>>isResponsibleForThisPlatform."

	"OSProcess isUnix"

	| numericOsVersion |

	^ (self platformName = 'unix') or:
		[numericOsVersion := self osVersion asInteger ifNil: [0].
		(self platformName = 'Mac OS') and: [numericOsVersion >= 1000]]
