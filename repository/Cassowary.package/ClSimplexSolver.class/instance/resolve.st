manipulating
resolve
	"Re-solve the current collection of constraints for the new values in newEditConstants."

	self infeasibleRows: OrderedCollection new.
	self resetStayConstants.
	self resetEditConstants.
	self dualOptimize.
	self setExternalVariables.