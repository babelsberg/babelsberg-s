platform identification
isNonUnixMac
	"True if the platform is Mac OS prior to OSX"

	"OSProcess isNonUnixMac"

	| numericOsVersion |
	numericOsVersion := self osVersion asInteger ifNil: [0].
	^ (self platformName = 'Mac OS') and: [numericOsVersion < 1000]
