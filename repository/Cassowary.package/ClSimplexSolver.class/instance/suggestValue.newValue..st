manipulating
suggestValue: var newValue: val
	"We should be editting var.  Suggest a new value for it.

	var <ClVariable>
	val <Float>"

	1 to: self editVars size do: [:i | 
		(editVars at: i) == var ifTrue: [
			self newEditConstants at: i put: val.  
			^self]].
	ClError internalError signal: 'variable not currently being edited'