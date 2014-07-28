private
terms
	"Answer the terms dictionary.  The keys in the dictionary will be variables and the values will be numbers ( the corresponding coefficients).. If 'terms' contains variables v1, ..., vn and coefficients a1, ..., an, then this object represents the linear expression:
	constant + a1*v1 + ... + an*vn
Note that the coefficients should all be nonzero -- if there were going to be a zero coefficient, that term should be dropped from the linear expression."

	^ terms