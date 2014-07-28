manipulation
incrementConstant: aNumber
	"Increment the constant part of this expression by aNumber."

	self constant: self constant + aNumber