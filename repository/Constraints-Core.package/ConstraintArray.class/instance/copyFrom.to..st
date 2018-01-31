copying
copyFrom: start to: stop 
	"In #ccm mode, replace all elements with CVs before copying values."
	self isConstructingConstraint
		ifTrue: [(1 to: self size) do: [:index | (self at: index)]]. "self at: will do it automatically."	
	^ super copyFrom: start to: stop 