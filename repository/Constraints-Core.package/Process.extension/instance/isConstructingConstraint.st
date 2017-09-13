*Constraints-Core
isConstructingConstraint

	^ (self environmentAt: #constraintObject ifAbsent: []) notNil or: [
		self csInfo activeLayers includes: #ccm]