private
initialize
	"Initialize this linear expression to 0"

	self flag: #schwa.  "original code uses LookupTable instead of Dictionary"
	self 
		constant: 0.0;
		terms: Dictionary new.
	^ self
