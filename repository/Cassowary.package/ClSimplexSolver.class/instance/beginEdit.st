manipulating
beginEdit
	"Do any needed setup to begin editing.  The sequence of calls should be:
		solver addEditVar: v1; addEditVar: v2; ... etc.
		solver beginEdit.
	Then repeat each time new values are provided for the editted variables:
		solver suggestValue: v1 newValue: nv1.
		solver suggestValue: v2 newValue: nv2.
		solver resolve.
	Then to terminate editing:
		solver endEdit."

	self newEditConstants: (Array new: self editVars size)