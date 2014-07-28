private
setExternalVariables
	"Set each external basic variable to its value, and set each external parametric variable to 0.  (It isn't clear that we will ever have external parametric variables -- every external variable should either have a stay on it, or have an equation that defines it in terms of other external variables that do have stays.  For the moment I'll put this in though.)  Variables that are internal to the solver don't actually store values -- their values are just implicit in the tableu -- so we don't need to set them."

	self rows keysAndValuesDo: [:var :expr | var isExternal ifTrue: [var value: expr constant]].
	self columns keysDo: [:var | var isExternal ifTrue: [var value: 0.0]].