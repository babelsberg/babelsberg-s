private
resolve: cs
	"Re-solve the current collection of constraints for new values for the constants of the edit variables.

	cs <Array of Float>"

	self newEditConstants: cs.
	self resolve