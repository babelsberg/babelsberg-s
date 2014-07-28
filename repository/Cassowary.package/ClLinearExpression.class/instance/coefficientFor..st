accessing
coefficientFor: aClVariable
	"Answer the coefficient corresponding to aClVariable (i.e. the 'ci' corresponding to the 'vi' that aClVariable is:
		v1@c1 + v2*c2 + ... + vn*cn + c"

	^ self terms at: aClVariable ifAbsent: [0.0]