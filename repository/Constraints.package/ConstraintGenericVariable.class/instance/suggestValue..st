accessing
suggestValue: aValue
	"This method adds an equality constraint for the new value. If all constraints are still solvable, the value is changed to aValue. Otherwise, the old value does not change and an exception is raised. Generic variables are not supposed to be changed. If so, all corresponding constraints should be recreated."
	self error: 'should disable and recalculate'