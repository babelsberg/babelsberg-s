instance creation
variable: aVariable value: aValue strength: aStrength

	^ (self variable: aVariable strength: aStrength)
		value: aValue;
		yourself